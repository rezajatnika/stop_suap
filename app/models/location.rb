class Location < ActiveRecord::Base
  # Associations
  belongs_to :story
  belongs_to :city
  belongs_to :province
end
