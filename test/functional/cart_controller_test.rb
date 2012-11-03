require 'test_helper'

class CartControllerTest < ActionController::TestCase
  test "should get add" do
    get :add
    assert_response :success
  end

  test "should get remove" do
    get :remove
    assert_response :success
  end

  test "should get list" do
    get :list
    assert_response :success
  end

  test "should get clear" do
    get :clear
    assert_response :success
  end

  test "should get checkout" do
    get :checkout
    assert_response :success
  end

end
