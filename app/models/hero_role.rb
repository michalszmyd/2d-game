class HeroRole < ApplicationRecord
  validates :name, presence: true

  has_many :heroes, dependent: :nullify
  has_many :items, dependent: :nullify
end
