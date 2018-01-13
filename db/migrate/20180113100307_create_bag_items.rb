class CreateBagItems < ActiveRecord::Migration[5.1]
  def change
    create_table :bag_items do |t|
      t.references :item, foreign_key: true, on_delete: :cascade, null: false
      t.references :bag, foreign_key: true, on_delete: :cascade, null: false

      t.timestamps
    end
  end
end
