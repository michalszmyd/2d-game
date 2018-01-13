class AddWidthAndHeightToWorld < ActiveRecord::Migration[5.1]
  def change
    add_column :worlds, :width, :integer, null: false, default: 500
    add_column :worlds, :height, :integer, null: false, default: 500
  end
end
