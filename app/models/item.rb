class Item < ApplicationRecord
  belongs_to :hero_role

  validates :name, :wear_place, :damage, :mana, :armor, :hero_role, presence: true
end
