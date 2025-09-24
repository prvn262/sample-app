require 'test_helper'

class PasswordResetsTest < ActionDispatch::IntegrationTest
  def setup
    ActionMailer::Base.deliveries.clear
    # empty the “sent emails” array before running the test.
    @user = users(:michael)
  end

  test "password resets" do
    get new_password_reset_path
    assert_template 'password_resets/new'
    assert_select 'input[name=?]', 'password_reset[email]'

    # Invalid email
    post password_resets_path, params: { password_reset: { email: "" } }
    assert_not flash.empty?
    assert_template 'password_resets/new'

    # Valid email
    post password_resets_path, params: { password_reset: { email: @user.email } }
    assert_not_equal @user.reset_digest, @user.reload.reset_digest
    assert_equal 1, ActionMailer::Base.deliveries.size
    assert_not flash.empty?
    assert_redirected_to root_url

    # Password reset form
    user = assigns(:user)
    # "assigns" is a Rails test helper that gives you access to instance variables defined in your controller

    # Wrong email
    get edit_password_reset_path(user.reset_token, email: "")
    assert_redirected_to root_url

    # Inactive user
    user.toggle!(:activated)
    get edit_password_reset_path(user.reset_token, email: user.email)
    assert_redirected_to root_url
    user.toggle!(:activated)

    # Right email, wrong token
    get edit_password_reset_path('wrong token', email: user.email)
    assert_redirected_to root_url

    # Right email, right token
    get edit_password_reset_path(user.reset_token, email: user.email)
    assert_template 'password_resets/edit'
    assert_select "input[name=email][type=hidden][value=?]", user.email
    # <input id="email" name="email" type="hidden" value="michael@example.com" />

    # Invalid password & confirmation
    patch password_reset_path(user.reset_token), params: { email: user.email, user: { password: "valid", password_confirmation: "invalid" } }
    assert_select 'div#error_explanation'

    # Empty password
    patch password_reset_path(user.reset_token), params: { email: user.email, user: { password: "", password_confirmation: "" } }
    assert_select 'div#error_explanation'

    # Valid password & confirmation
    patch password_reset_path(user.reset_token), params: { email: user.email, user: { password: "password", password_confirmation: "password" } }
    assert is_logged_in?
    assert_not flash.empty?
    assert_redirected_to user

    # reset_digest should be cleared after reset password.
    assert_nil user.reload.reset_digest
  end

  test "expired token" do
    get new_password_reset_path
    # Sends a POST request to generate a reset token for the user.
    post password_resets_path, params: { password_reset: { email: @user.email } }
    @user = assigns(:user)
    @user.update_attribute(:reset_sent_at, 3.hours.ago)
    # Try to reset the password
    patch password_reset_path(@user.reset_token), params: { email: @user.email, user: { password: "password", password_confirmation: "password"} }
    assert_response :redirect
    follow_redirect!
    assert_match /expired/i, response.body
  end
end
























