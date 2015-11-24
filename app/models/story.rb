class Story < ActiveRecord::Base
  before_save :set_email, :set_user
  after_create :set_anonymous

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

  def set_anonymous
    self.anonymous = false if self.email == self.user.email
    save
  end
end
