class Province < ActiveRecord::Base
  # Associations
  has_many :cities
end
