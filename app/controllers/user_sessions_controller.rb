class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      logger.info("Login successful: #{@user_session.email}")
      redirect_to root_path, success: 'Logged in!'
    else
      logger.info("Login failed from: #{request.remote_ip}")
      flash.now[:warning] = 'Invalid email or password.'
      render :new
    end
  end

  def destroy
    current_user_session.destroy
    logger.info('Logout successful')
    redirect_to root_path, success: 'Logged out!'
  end
end
