class World < ApplicationRecord
  has_many :world_environments, dependent: :destroy
  has_many :environments, through: :world_environments

  validates :name, :required_level, presence: true
end
