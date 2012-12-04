require 'test_helper'

class ApplicationelperTest < ActionView::TestCase
	test "not_found_function" do
		assert_raise(ActionController::RoutingError){not_found}
	end

	test "admin_only_as_anonymus" do
		assert_raise(ActionController::RoutingError){admin_only}
	end

	test "admin_only_as_logged_in" do
		session[:logged_in] = true
		assert admin_only == nil
	end
end
