class AddAnonymousToStories < ActiveRecord::Migration
  def change
    add_column :stories, :anonymous, :boolean, default: true
  end
end
