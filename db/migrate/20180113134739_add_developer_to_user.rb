class AddDeveloperToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :developer, :boolean, null: false, default: false
  end
end
