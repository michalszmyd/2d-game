class HeroRole < ApplicationRecord
  has_attached_file :template,
                    styles: { normal: '32x32>' },
                    default_url: '/images/:style/missing.png'

  validates_attachment_content_type :template, content_type: %r{\Aimage\/.*\z}

  validates :name, presence: true

  has_many :heroes, dependent: :nullify
  has_many :items, dependent: :nullify
end
