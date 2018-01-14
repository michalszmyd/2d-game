class Hero < ApplicationRecord
  belongs_to :hero_role
  belongs_to :user
  belongs_to :world

  has_many :hero_items, dependent: :destroy
  has_many :items, through: :hero_items

  validates :hero_role, :user, :strength,
            :agility, :inteligence, presence: true
end
