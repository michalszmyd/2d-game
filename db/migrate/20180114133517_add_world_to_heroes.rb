class AddWorldToHeroes < ActiveRecord::Migration[5.1]
  def change
    add_reference :heros, :world, foreign_key: true, on_delete: :nullify, default: World.first.id
  end
end
