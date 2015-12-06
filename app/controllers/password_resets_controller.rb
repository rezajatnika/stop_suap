class PasswordResetsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user
      @user.deliver_password_reset_instructions!
      flash[:success] = 'Instruksi untuk mengganti password telah dikirim.'
      redirect_to root_path
    else
      flash[:warning] = 'Tidak ada user untuk email yang diminta'
      render :new
    end
  end

  def edit
    @user = User.find_by(perishable_token: params[:id])
  end

  def update
    @user = User.find_by(perishable_token: params[:id])
    if @user.update(password_reset_params)
      flash[:success] = 'Password berhasil diganti, anda telah otomatis login.'
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def password_reset_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
