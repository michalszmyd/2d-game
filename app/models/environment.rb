class Environment < ApplicationRecord
  has_many :world_environments, dependent: :destroy
  has_many :worlds, through: :world_environments

  validates :name, :permeable, presence: true
end
