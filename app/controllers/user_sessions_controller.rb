class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      redirect_to root_path, success: 'Logged in!'
    else
      flash.now[:warning] = '<strong>Oops...</strong> Invalid email or password.'
      render :new
    end
  end

  def destroy
    current_user_session.destroy
    redirect_to root_path, success: 'Logged out!'
  end
end
