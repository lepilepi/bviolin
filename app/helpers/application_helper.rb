module ApplicationHelper
	
	def not_found
		raise ActionController::RoutingError.new('Not Found')
	end
	
	def admin_only
		if not session[:logged_in]
  			not_found
  		end
  	end

end
