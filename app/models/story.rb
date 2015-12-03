class Story < ActiveRecord::Base
  before_validation :set_email, :set_user

  # Associations
  has_one :location
  accepts_nested_attributes_for :location, reject_if: :all_blank

  has_many :comments, dependent: :destroy

  belongs_to :user
  belongs_to :category

  # Validations
  validates :title,      presence: true, length: { maximum: 160 }
  validates :category,   presence: true
  validates :content,    presence: true
  validates :amount,     presence: true
  validates :location,   presence: true
  validates :event_date, presence: true
  validates :email,      presence: true,
    format: { with: Authlogic::Regex.email }

  private

  def set_user
    self.user ||= User.find_by_email('anon@ymous.com')
  end

  def set_email
    self.email ||= self.user.email
  end
end
