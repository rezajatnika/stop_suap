class AddForeignKeyToLocations < ActiveRecord::Migration
  def change
    add_foreign_key :locations, :stories, on_delete: :cascade
  end
end
