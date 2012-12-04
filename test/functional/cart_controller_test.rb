require 'test_helper'

class CartControllerTest < ActionController::TestCase
  test "update (add to cart)" do
    post :update, {:id => items(:zongora).id, :amount => 5}
    assert_equal session[:items][items(:zongora)], 5
    assert_response :redirect
  end

  test "should remove item form the cart" do
    session[:items]={}
    session[:items][items(:zongora)] = 5

    post :remove, :id => items(:zongora).id
    assert_response :redirect
    assert_nil session[:items][items(:zongora)]
  end

  test "index" do
    get :index
    assert_response :success
  end

  test "shouldn't get checkout with empty cart" do
    get :checkout
    assert_response 403
  end

  test "get checkout" do
    session[:items]={}
    session[:items][items(:zongora)] = 5
    update_total

    get :checkout
    assert_response :success
  end

  test "order" do
    session[:items]={}
    session[:items][items(:zongora)] = 5
    update_total

    post :order, :order => {:name => 'n', :email => 'e', :address => 'a', :phone => 'p', :notes => 'n'}
    assert_nil session[:items]
    assert_response :redirect
  end

end
