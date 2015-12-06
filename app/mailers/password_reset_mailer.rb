class PasswordResetMailer < ApplicationMailer
  def reset_email(user)
    @user = user
    mail(to: @user.email, subject: 'Instruksi mengganti password') do |format|
      format.text
    end
  end
end
