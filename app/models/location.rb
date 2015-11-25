class Location < ActiveRecord::Base
  # Associations
  belongs_to :story
  belongs_to :city
  belongs_to :province

  # Validates
  validates :city, :province, presence: true
  validate :city_must_be_in_corresponding_province

  def city_must_be_in_corresponding_province
    unless province.cities.include?(self.city)
      errors.add(:city, 'wrong city association')
    end
  end
end
