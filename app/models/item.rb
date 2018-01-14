class Item < ApplicationRecord
  belongs_to :hero_role

  validates :name, :wear_place, :damage,
            :mana, :armor, :hero_role, presence: true

  has_many :hero_items, dependent: :destroy
  has_many :heroes, through: :hero_items
end
