class Bag < ApplicationRecord
  belongs_to :hero

  validates :hero, :size, presence: true

  has_many :bag_items, dependent: :destroy
  has_many :items, through: :bag_items
end
