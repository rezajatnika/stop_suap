class Story < ActiveRecord::Base
  before_save :set_email, :set_user

  # Associations
  has_one :location
  validates_associated :location
  accepts_nested_attributes_for :location, reject_if: :all_blank

  belongs_to :user
  belongs_to :category

  # Validations
  validates :title,      presence: true, length: { maximum: 160 }
  validates :category,   presence: true
  validates :content,    presence: true
  validates :amount,     presence: true
  validates :event_date, presence: true
  validates :email,      presence: true,
    format: { with: Authlogic::Regex.email }

  attr_reader :agreement
  validates :agreement, acceptance: true

  private

  def set_user
    self.user ||= User.find_by_email('anon@ymous.com')
  end

  def set_email
    self.email ||= self.user.email
  end
end
