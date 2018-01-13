class BagItem < ApplicationRecord
  belongs_to :item
  belongs_to :bag

  validates :item, :bag, presence: true
end
