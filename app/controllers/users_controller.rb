class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      logger.info("New user created: #{@user.email}")
      redirect_to root_path, success: 'Welcome to Stop Suap!'
    else
      logger.info("Failed to create user from: #{request.remote_ip}")
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
