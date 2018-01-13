class CreateBags < ActiveRecord::Migration[5.1]
  def change
    create_table :bags do |t|
      t.references :hero, foreign_key: true, on_delete: :cascade
      t.integer :size, null: false, default: 30

      t.timestamps
    end
  end
end
