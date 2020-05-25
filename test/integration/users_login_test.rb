require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  test "login with invalid info" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: "", password: "" } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login with valid info" do
    get login_path
    assert_template 'sessions/new'
  post login_path, params: { session: { email: "a@a.com", password: "123456" } }
    assert_template 'users/show'
  end
end
