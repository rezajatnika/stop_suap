class RemoveProvinceFromLocations < ActiveRecord::Migration
  def change
    remove_column :locations, :province, :string
  end
end
