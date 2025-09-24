require "test_helper"

class UsersIndexTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @admin = users(:michael)
    @non_admin = users(:archer)
    @activated = users(:lana)
    @non_activated = users(:malory)
   end

  test "index as admin including pagination & delete links" do
    log_in_as(@admin)
    get users_path
    assert_template "users/index"
    assert_select "div.pagination"
    first_page_of_user = User.paginate(page: 1, per_page: 10)
    first_page_of_user.each do |user|
      assert_select "a[href=?]", user_path(user), text: user.name  unless user == @admin
      assert_select "a[href=?]", user_path(user), text: "delete"
    end
    assert_difference "User.count", -1 do
      delete user_path(@non_admin)
    end
  end

  test "index as non_admin" do
    log_in_as(@non_admin)
    get users_path
    assert_select "a", text: "delete", count: 0
  end

  test "index only shows activated users" do
    log_in_as(@activated)
    get users_path
    assert_response :success
    assert_template "users/index"
    assert_select "a[href=?]", user_path(@non_activated), count: 0
  end

  test "redirect non_activated user" do
    log_in_as(@non_activated)

    assert_redirected_to root_url
  end
end




# User.paginate(page: 1, per_page: 10).each do |user|
#       assert_select "a[href=?]", user_path(user), text: user.name
#     end
