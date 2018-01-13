class Item < ApplicationRecord
  belongs_to :hero_role

  validates :name, :wear_place, :damage,
            :mana, :armor, :hero_role, presence: true

  has_many :bag_items, dependent: :destroy
  has_many :bags, through: :bag_items
end
