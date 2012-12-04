require 'test_helper'

class BuySomethingTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "new_item" do
  	get url_for(:controller=>:items, :action=>:index)
  	assert_response :success

	get url_for(:controller=>:items, :action=>:show, :id=>items(:zongora).id)
  	assert_response :success
  	
  	post_via_redirect "/cart/update",
  		{:id => items(:zongora).id, :amount => 5}

  	assert_response :success

  	get url_for(:controller=>:cart, :action=>:checkout)
    assert_response :success

    post_via_redirect "/cart/order",
    	:order => {:name => 'n', :email => 'e', :address => 'a', :phone => 'p', :notes => 'n'}
    assert_nil session[:items]
    
    assert_response :success

  end
end
