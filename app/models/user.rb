class User < ActiveRecord::Base
  attr_accessible :password, :username

  def authenticate(password)
  	if self.password==password
  		true
  	end
  end

end
