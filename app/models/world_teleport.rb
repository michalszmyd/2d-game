class WorldTeleport < ApplicationRecord
  belongs_to :world
  belongs_to :teleport

  validates :world, :teleport, :position_x, :position_y, presence: true
end
