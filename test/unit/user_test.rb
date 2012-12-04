require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "login_with_empty_password" do
  	assert !users(:admin1).authenticate(''), "It is able to login with empty password"
  end

  test "login_with_wrong_password" do
  	assert !users(:admin1).authenticate('wrong password'), "It is able to login with wrong password"
  end

  test "login" do
  	assert users(:admin1).authenticate('pwd1'), "It is not able to login"
  end
end
