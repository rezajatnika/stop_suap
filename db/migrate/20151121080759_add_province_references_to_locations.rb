class AddProvinceReferencesToLocations < ActiveRecord::Migration
  def change
    add_reference :locations, :province, index: true, foreign_key: true
  end
end
