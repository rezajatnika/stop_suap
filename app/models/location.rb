class Location < ActiveRecord::Base
  # Associations
  belongs_to :story
end
