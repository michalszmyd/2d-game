class Hero < ApplicationRecord
  belongs_to :hero_role
  belongs_to :user
  has_one :bag, dependent: :destroy

  validates :hero_role, :user, :strength,
            :agility, :inteligence, presence: true
end
