class Teleport < ApplicationRecord
  has_attached_file :image, styles: { normal: "32x32>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  belongs_to :world

  has_many :world_teleports, dependent: :destroy
  has_many :worlds, through: :world_teleports

  validates :name, :world, presence: true
end
