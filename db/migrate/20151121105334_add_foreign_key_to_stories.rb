class AddForeignKeyToStories < ActiveRecord::Migration
  def change
    add_foreign_key :stories, :users, on_delete: :cascade
    add_foreign_key :stories, :categories, on_delete: :cascade
  end
end
