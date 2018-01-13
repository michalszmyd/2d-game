class Bag < ApplicationRecord
  belongs_to :hero

  validates :hero, :size, presence: true
end
