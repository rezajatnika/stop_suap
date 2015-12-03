class Story < ActiveRecord::Base
  before_validation :set_email, :set_user, :set_name

  # Associations
  has_one :location
  accepts_nested_attributes_for :location, reject_if: :all_blank

  belongs_to :user
  belongs_to :category

  # Validations
  validates :title,      presence: true, length: { maximum: 160 }
  validates :category,   presence: true
  validates :content,    presence: true
  validates :amount,     presence: true
  validates :location,   presence: true
  validates :event_date, presence: true
  validates :paid,       presence: true
  validates :name,       presence: true
  validates :email,      presence: true,
    format: { with: Authlogic::Regex.email }

  enum paid: [:notpaid, :paid]

  private

  def set_user
    self.user ||= User.find_by_email('anon@ymous.com')
  end

  def set_email
    self.email ||= self.user.email
  end

  def set_name
    self.name ||= self.user.name
  end
end
