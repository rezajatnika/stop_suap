class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.valid?
      ContactMailer.contact(@contact).deliver_now
      redirect_to new_contact_path, notice: 'pesan anda telah terkirim'
    else  
      render 'new'
    end
  end

  private
  
  def contact_params
    params.require(:contact).permit(:name, :email, :subject, :message)
  end
end
