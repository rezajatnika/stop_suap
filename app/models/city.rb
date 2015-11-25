class City < ActiveRecord::Base
  # Associations
  belongs_to :province

  # Validations
  validates :name, :province, presence: true
end
