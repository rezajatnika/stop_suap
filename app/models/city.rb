class City < ActiveRecord::Base
  # Associations
  belongs_to :province
end
