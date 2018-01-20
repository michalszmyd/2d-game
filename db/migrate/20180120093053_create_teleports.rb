class CreateTeleports < ActiveRecord::Migration[5.1]
  def change
    create_table :teleports do |t|
      t.string :name, null: false
      t.references :world, foreign_key: true, null: false, on_delete: :cascade

      t.timestamps
    end
  end
end
