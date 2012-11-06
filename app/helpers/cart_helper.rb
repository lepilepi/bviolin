module CartHelper

	def update_total
		total = 0

		if session.has_key?(:items)
			session[:items].each do |item, amount|
				total += item.price*amount
			end
		end
		
		session[:total] = total
	end

end
