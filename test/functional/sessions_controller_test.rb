require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "login_form" do
    get :new
    assert_response :success
  end

  test "login" do
	 post :create, :session => {:username => users(:admin1).username, :password => users(:admin1).password}
	 assert_response :redirect
	 assert session[:logged_in]
  end

  test "login_failed" do
	 post :create, :session => {:username => users(:admin1).username, :password => 'wrong password'}
	 assert_response :success
	 assert !session[:logged_in]
  end

  test "logout" do
  	get :destroy, :id => users(:admin1).id
  	assert_response :redirect
  	assert_nil session[:logged_in]
  end

end
