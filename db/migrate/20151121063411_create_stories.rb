class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.belongs_to :category, index: true
      t.belongs_to :user, index: true
      t.string :title
      t.text :content
      t.float :amount
      t.datetime :event_date

      t.timestamps null: false
    end
  end
end
