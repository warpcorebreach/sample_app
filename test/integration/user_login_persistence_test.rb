require 'test_helper'

class UserLoginPersistenceTest < ActionDispatch::IntegrationTest
  test "root page logged out" do
    get root_path
    assert_select "a[href=?]", login_path
  end

  test "root page logged in" do
    get login_path
    post login_path, params: { session: { email: "test@test.com",
                                          password: "testtest" } }
    #get root_path
    assert_select "a[href=?]", logout_path 
  end
end
