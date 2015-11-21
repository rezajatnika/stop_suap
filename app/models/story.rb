class Story < ActiveRecord::Base
  # Associations
  has_one :location, dependent: :destroy

  belongs_to :user
  belongs_to :category
end
