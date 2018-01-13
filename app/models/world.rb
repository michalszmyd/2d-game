class World < ApplicationRecord
  validates :name, :required_level, presence: true
end
