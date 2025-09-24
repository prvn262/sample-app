require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "login with invalid information" do
    get login_path
    assert_template "sessions/new"
    post login_path, params: { session: {email: "", password:   ""}}
    assert_template "sessions/new"
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login with valid information" do
    get login_path
    post login_path, params: { session: {email:  @user.email, password: "password"}}
    assert_redirected_to @user
    follow_redirect!
    assert_template "users/show"
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
  end

  test "login with valid email/invalid password" do
    get login_path
    assert_template "sessions/new"
    post login_path, params: { session: { email: @user.email, password: "invalid"}}
    assert_not is_logged_in?
    assert_template "sessions/new"
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login with valid information followed by logout" do
    get login_path
    post login_path, params: { session: { email: @user.email, password: "password"}}
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_template "users/show"
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url

    delete logout_path
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path, count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
  end

  test "login with remembering" do
    log_in_as(@user, password: "password", remember_me: "1")
    assert_not_empty cookies[:remember_token]
  end

  test "login without remembering" do
    # Log in to set the cookie.
    log_in_as(@user, password: "password", remember_me: "1")
    # Log in again and verify that the cookie is deleted
    log_in_as(@user, password: "password", remember_me: "0")
    cookies.delete(:remember_token)
    assert_empty cookies[:remember_token]
  end

  test "friendly forwarding only works first time" do
    # user comes at protected page
    get edit_user_path(@user)
    # forwarding page saved correctly.
    assert_equal session[:forwarding_url], "http://www.example.com" + edit_user_path(@user)

    log_in_as(@user)
    assert_redirected_to edit_user_path(@user)
    # forwarding_url should be deleted(Nil.)
    assert_nil session[:forwarding_url]

    # now log out:
    delete logout_path
    # login again:
    log_in_as(@user)
    # Go by default mostly profile page
    assert_redirected_to @user
  end
end

























