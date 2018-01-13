class WorldEnvironment < ApplicationRecord
  belongs_to :world
  belongs_to :environment

  validates :world, :environment, :position_x, :position_y, presence: true
end
