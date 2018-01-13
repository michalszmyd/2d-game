class CreateEnvironments < ActiveRecord::Migration[5.1]
  def change
    create_table :environments do |t|
      t.string :name, null: false
      t.boolean :permeable, null: false, default: true

      t.timestamps
    end
  end
end
