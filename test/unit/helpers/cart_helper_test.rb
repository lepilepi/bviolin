require 'test_helper'

class CartHelperTest < ActionView::TestCase
	test "update_total_cart_empty" do 
		update_total
		assert session[:total] = 0, "update_total was not working correctly with empty cart"
	end

	test "update_total" do
		i = Item.new
		i.price = 500
		session[:items] = {i => 10}

		update_total
		assert session[:total] = 5000, "update_total was not working correctly"
	end
end
