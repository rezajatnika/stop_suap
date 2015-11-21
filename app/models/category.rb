class Category < ActiveRecord::Base
  # Associations
  has_many :stories, dependent: :destroy
end
