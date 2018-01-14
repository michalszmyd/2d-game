class HeroItem < ApplicationRecord
  belongs_to :item
  belongs_to :hero

  validates :item, :hero, presence: true
end
