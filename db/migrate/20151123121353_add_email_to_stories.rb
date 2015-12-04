class AddEmailToStories < ActiveRecord::Migration
  def change
    add_column :stories, :email, :string
    add_column :stories, :name, :string
  end
end
