class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.belongs_to :story, index: true
      t.belongs_to :city, index: true
      t.belongs_to :province, index: true

      t.timestamps null: false
    end
  end
end
