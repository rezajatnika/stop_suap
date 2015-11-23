class AddForeignKeyToCities < ActiveRecord::Migration
  def change
    add_foreign_key :cities, :provinces, on_delete: :cascade
  end
end
