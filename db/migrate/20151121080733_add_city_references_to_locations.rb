class AddCityReferencesToLocations < ActiveRecord::Migration
  def change
    add_reference :locations, :city, index: true, foreign_key: true
  end
end
