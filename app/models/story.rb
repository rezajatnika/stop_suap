class Story < ActiveRecord::Base
  before_save :set_email, :set_user

  # Associations
  has_one :location

  belongs_to :user
  belongs_to :category

  private

  def set_user
    self.user ||= User.find_by_email('anon@ymous.com')
  end

  def set_email
    self.email ||= self.user.email
  end
end
