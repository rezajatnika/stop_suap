class Province < ActiveRecord::Base
  # Associations
  has_many :cities

  # Validations
  validates :name, presence: true
end
