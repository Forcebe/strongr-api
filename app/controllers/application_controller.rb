class ApplicationController < ActionController::Base

  skip_before_action :verify_authenticity_token #Not using rails frontend

# Set up helper methods to pass them to other controllers
  helper_method :login!, :logged_in?, :current_user, :authorized_user?, :logout!

# Create a session for @user
  def login!
    session[:user_id] = @user.id
  end

# Check if a users is logged in
  def logged_in?
    !!session[:user_id]
  end

# Check who the current user is
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

# Check if the current user is the right one
  def authorized_user?
    @user == current_user
  end

# Clear the current session
  def logout!
    session.clear
  end

end
