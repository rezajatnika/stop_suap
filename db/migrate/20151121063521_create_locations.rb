class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.belongs_to :story, index: true
      t.string :city
      t.string :province

      t.timestamps null: false
    end
  end
end
