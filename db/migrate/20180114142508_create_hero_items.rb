class CreateHeroItems < ActiveRecord::Migration[5.1]
  def change
    create_table :hero_items do |t|
      t.references :hero, foreign_key: true, null: false, on_delete: :cascade
      t.references :item, foreign_key: true, null: false, on_delete: :cascade

      t.timestamps
    end
  end
end
