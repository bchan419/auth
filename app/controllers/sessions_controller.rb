class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      # .authenticate - method in "has_secure_password library"
      session[:user_id] = user.id #store the id in session
      redirect_to root_url, :notice => "User logged in"      
    else
      flash.now.alert = "Email or password is invalid!"
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
    
end
