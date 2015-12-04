class Contact
  include ActiveModel::Model

  attr_accessor :name, :email, :subject, :message

  validates_presence_of :name, :email, :subject, :message
  validates :email, format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/ }
end