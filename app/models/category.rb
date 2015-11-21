class Category < ActiveRecord::Base
  # Associations
  has_many :stories
end
