class SessionsController < ApplicationController

  def new
  end

  def create
  	user = User.find_by_username(params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:logged_in] = true
      redirect_to :action => "index", :controller => "items"
    else
      flash.now[:error] = 'Invalid username/password combination'
      render 'new'
    end
  end

  def destroy
  	reset_session
  	flash[:notice] =  "You have succesfully logged out."
  	redirect_to :action => "index", :controller => "items"
  end

end
