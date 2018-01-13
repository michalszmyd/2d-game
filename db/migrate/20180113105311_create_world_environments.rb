class CreateWorldEnvironments < ActiveRecord::Migration[5.1]
  def change
    create_table :world_environments do |t|
      t.references :world, foreign_key: true, null: false, on_delete: :cascade
      t.references :environment, foreign_key: true, null: false, on_delete: :cascade
      t.integer :position_x, null: false, default: false
      t.integer :position_y, null: false, default: 0

      t.timestamps
    end
  end
end
