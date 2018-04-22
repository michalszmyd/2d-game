class Environment < ApplicationRecord
  has_attached_file :image,
                    styles: { normal: '32x32>' },
                    default_url: '/images/:style/missing.png'

  validates_attachment_content_type :image, content_type: %r{\Aimage\/.*\z}

  has_many :world_environments, dependent: :destroy
  has_many :worlds, through: :world_environments

  validates :name, :permeable, presence: true
end
