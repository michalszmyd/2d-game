class CreateWorldTeleports < ActiveRecord::Migration[5.1]
  def change
    create_table :world_teleports do |t|
      t.references :world, foreign_key: true, null: false, on_delete: :cascade
      t.references :teleport, foreign_key: true, null: false, on_delete: :cascade
      t.integer :position_x, null: false
      t.integer :position_y, null: false

      t.timestamps
    end
  end
end
