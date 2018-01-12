class CreateHeros < ActiveRecord::Migration[5.1]
  def change
    create_table :heros do |t|
      t.string :name
      t.references :hero_role, foreign_key: true, null: false, on_delete: :nullify
      t.references :user, foreign_key: true, null: false, on_delete: :nullify
      t.integer :strength, null: false, default: 0
      t.integer :agility, null: false, default: 0
      t.integer :inteligence, null: false, default: 0

      t.timestamps
    end
  end
end
