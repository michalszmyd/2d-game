class Hero < ApplicationRecord
  belongs_to :hero_role
  belongs_to :user

  validates :hero_role, :user, :strength, :agility, :inteligence, presence: true
end
