class SessionsController < ApplicationController
  
  before_filter :require_no_user, :only => [:new]
  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, :notice => "logged in"
    else
      flash.now.alert = "Invalid username or password"
      render "new"
    end    
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged Out"
  end
  
  
end
