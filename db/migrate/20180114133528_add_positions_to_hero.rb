class AddPositionsToHero < ActiveRecord::Migration[5.1]
  def change
    add_column :heros, :position_x, :integer, default: 10
    add_column :heros, :position_y, :integer, default: 10
  end
end
