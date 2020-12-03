class UsersController < ApplicationController

# Index renders JSON data for all of the users in the @users variable. If
# there are no users it renders an error in JSON
def index
  @users = User.all
  if @users
    render json: {
      users: @users
    }
  else
    render json: {
      status: 500,
      errors: ['no users found']
    }
  end
end

# Show renders JSON for a given user ID or an error if not found
def show
  @user = User.find(params[:id])
  if @user
    render json: {
      user: @user
    }
  else
    render json: {
      status: 500,
      errors: ['user not found']
    }
  end
end

# Create creates a nerw user with the given params. If it saves succesfully,
# log in as that user render JSON with that user and the status of creted.
# If not, renders JSON with the generated error.
def create
  @user = User.new(user_params)
  if @user.save
    login!
    render json: {
      status: :created,
      user: @user
    }
  else
    render json: {
      status: 500,
      errors: @user.errors.full_messages
    }
  end
end

private

# Defines allowed params for creating a user.
def user_params
  params.require(:user).permit(:username, :email, :password, :password_confirmation)
end

end
