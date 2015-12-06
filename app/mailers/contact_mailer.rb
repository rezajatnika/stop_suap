class ContactMailer < ApplicationMailer
  default to: 'admin@rakarsa.com'

  def contact(contact)
    @contact = contact
    mail(from: @contact.email, subject: @contact.subject)
  end
end
