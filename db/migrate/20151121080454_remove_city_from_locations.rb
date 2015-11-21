class RemoveCityFromLocations < ActiveRecord::Migration
  def change
    remove_column :locations, :city, :string
  end
end
