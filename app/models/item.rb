class Item < ApplicationRecord
  has_attached_file :image, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :image, content_type: %r{\Aimage\/.*\z}

  belongs_to :hero_role

  validates :name, :wear_place, :damage,
            :mana, :armor, :hero_role, presence: true

  has_many :hero_items, dependent: :destroy
  has_many :heroes, through: :hero_items

  def as_json(_options = {})
    {
      image: image.url,
      name: name,
      wear_place: wear_place,
      damage: damage,
      mana: mana,
      armor: armor,
      class_name: hero_role.name
    }
  end
end
