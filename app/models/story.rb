class Story < ActiveRecord::Base
  # Associations
  has_one :location

  belongs_to :user
  belongs_to :category
end
