class AddEmailAndNameToStories < ActiveRecord::Migration
  def change
    add_column :stories, :email, :string
  end
end
