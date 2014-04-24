require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should save user device token" do
    new_user = {device_token: "ABCD"}
    assert_nil User.find_by(new_user)
    post :create, user: new_user
    assert User.find_by(new_user)
  end
end
