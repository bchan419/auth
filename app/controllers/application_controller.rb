class ApplicationController < ActionController::Base
  protect_from_forgery

# Keep the record of an user is currently signed in by defining a "current_user"
# so we can change the status to an user is currently logged in
# if defined in ApplicationController, it is available in all controllers
private # This ensure user is logged in before proforming other actions (e.g. Edit)
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # This cast @current_user as an instance variable to it could be repeatedly
    # accessible by other methods
  end

  helper_method :current_user
  # make current_user accessible to the view files
end
