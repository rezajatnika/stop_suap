class AddProvinceReferencesToCities < ActiveRecord::Migration
  def change
    add_reference :cities, :province, index: true, foreign_key: true
  end
end
