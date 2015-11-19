class User < ActiveRecord::Base
  # Acts as authentic for authlogic
  acts_as_authentic do |c|
    # We are gonna use BCrypt
    c.crypto_provider = Authlogic::CryptoProviders::BCrypt

    # Some validations
    c.merge_validates_length_of_password_field_options(in: 8..30)

    c.merge_validates_length_of_login_field_options(in: 5..25)
    c.merge_validates_format_of_login_field_options(
      with: /\A[a-zA-Z0-9_][a-zA-Z0-9\.+\-_@]+\z/,
      message: 'should use only letters, numbers, and .-_@'
    )

    c.merge_validates_length_of_email_field_options(maximum: 50)
    c.merge_validates_format_of_email_field_options(
      message: 'should use valid email address format'
    )
  end
end
