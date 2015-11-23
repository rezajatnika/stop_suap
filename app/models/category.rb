class Category < ActiveRecord::Base
  # Associations
  has_many :stories

  # List category for select input
  def self.list_category
    Category.all.collect { |cat| [cat.name, cat.id] }
  end
end
