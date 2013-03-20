class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
  def current_user
     @current_user ||= User.find(session[:user_id]) if session[:user_id]
   end
   
   def logged_in?
    current_user ? true : false
   end
    
   def require_user
     redirect_to sessions_new unless logged_in?     
   end   
   
   def require_no_user
     redirect_to root_path if logged_in?
   end
    
   helper_method :current_user, :logged_in?, :require_user, :require_no_user
end
