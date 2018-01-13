class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :wear_place, null: false
      t.integer :damage, null: false, default: 0
      t.integer :mana, null: false, default: 0
      t.integer :armor, null: false, default: 0
      t.references :hero_role, foreign_key: true, on_delete: :nullify

      t.timestamps
    end
  end
end
