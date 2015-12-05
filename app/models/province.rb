class Province < ActiveRecord::Base
  # Associations
  has_many :cities
  accepts_nested_attributes_for :cities

  # Validations
  validates :name, presence: true
end
