require 'test_helper'

class NewItemTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "new_item" do
  	get url_for(:controller=>:sessions, :action=>:new)
  	assert_response :success
  	post_via_redirect "/sessions/create",
  		:session => {:username => users(:admin1).username, :password => users(:admin1).password}

  	assert_response :success
  	assert session[:logged_in]

  	get url_for(:controller=>:items, :action=>:new)
  	assert_response :success

  	post_via_redirect "/items/create",
  		:item => {:name => "x", :price => 6}
  	assert_response :success

  	get url_for(:controller=>:items, :action=>:index)
  	assert_response :success

  	assert Item.find_by_name('x')
  	assert_tag(:tag => 'div', :attributes => {'data-id' => Item.find_by_name('x').id })

  end

end
