require "test_helper"

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)   # fixtures से user load किया
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    # "opening edit page"
    get edit_user_path(@user)
    assert_template "users/edit"

    # submitting invalid data
    patch user_path(@user), params: { user: { name: "", email: "xyz@invalid", password: "xyz", password_confirmation: "abc"}}

    # edit template should show:
    assert_template "users/edit"
  end

  test "successful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template "users/edit"
    name = "Exam ple"
    email = "exam@ple.com"
    patch user_path(@user), params: { user: { name: name, email: email, password: "password123", password_confirmation: "password123"}}
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email
  end

  test "successful edit with friendly forwarding" do
    get edit_user_path(@user)
    log_in_as(@user)
    # assert_template "users/edit"
    assert_redirected_to edit_user_path(@user)
    name = "Exam Ple"
    email = "exam@ple.com"
    patch user_path(@user), params: { user: { name: name, email: email, password: "password123", password_confirmation: "password123"}}
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name,  @user.name
    assert_equal email, @user.email
  end
end
