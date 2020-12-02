class SessionsController < ApplicationController

# Creates a session with the appropriate user or renders an error JSON
def create
  @user = User.find_by(email: session_params[:email])

  if @user && @user.authenticate(session_params[:password])
    login!
    render json: {
      logged_in: true,
      user: @user
    }
  else
    render json: {
      status: 401,
      errors: ['no such user', 'verify credentials and try again or signup']
    }
  end
end

# Checks for a logged in user, returns logged_in: true and the user or an error
def is_logged_in?
  if logged_in? && current_user
    render json: {
      logged_in: true,
      user: current_user
    }
  else
    render json: {
      logged_in: false,
      message: 'No such user'
    }
  end
end

# Logs out the current user.
def destroy
  logout!
  render json: {
    status: 200,
    logged_out: true
  }
end

private

# Requires a :user param, defines the permitted params
def session_params
  params.require(:user).permit(:username, :email, :password)
end

end
