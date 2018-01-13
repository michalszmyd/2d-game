class CreateWorlds < ActiveRecord::Migration[5.1]
  def change
    create_table :worlds do |t|
      t.string :name, null: false
      t.integer :required_level, null: false, default: 1

      t.timestamps
    end
  end
end
