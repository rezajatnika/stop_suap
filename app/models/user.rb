class User < ActiveRecord::Base
  # Associations
  has_many :stories

  # Acts as authentic for authlogic
  acts_as_authentic do |c|
    # We are gonna use BCrypt
    c.crypto_provider = Authlogic::CryptoProviders::BCrypt

    # Using email for login field
    c.login_field = :email

    # Some validations
    c.merge_validates_length_of_password_field_options(in: 8..30)
    c.merge_validates_length_of_email_field_options(maximum: 50)
    c.merge_validates_format_of_email_field_options(
      message: 'should use valid email address format'
    )
  end

  validates :name, presence: true, length: { in: 3..50 }

  def change_current_password!(current, new_password, confirmation)
    if new_password == confirmation && self.valid_password?(current)
      update_attributes!(
        password: new_password,
        password_confirmation: confirmation
      )
    else
      return false
    end
  end

  def deliver_password_reset_instructions!
    reset_perishable_token!
    PasswordResetMailer.reset_email(self).deliver_later
  end
end
