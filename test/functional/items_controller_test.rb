require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  test "should get list" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, :id => items(:zongora).id
    assert_response :success
  end

  test "should get new" do
    session[:logged_in] = true
    get :new
    assert_response :success
  end

  test "should get edit" do
    session[:logged_in] = true
    get :edit, :id => items(:zongora).id
    assert_response :success
  end

  test "create" do
    session[:logged_in] = true
    post :create, :item => {:name => "x", :price => 6}
    assert_response :redirect
  end

  test "destroy" do
    session[:logged_in] = true
    post :destroy, :id => items(:zongora).id
    assert_response :redirect
  end 

end
