class World < ApplicationRecord
  has_attached_file :background, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :background, content_type: /\Aimage\/.*\z/

  has_many :world_environments, dependent: :destroy
  has_many :environments, through: :world_environments

  validates :name, :required_level, presence: true

  def insert_environment_elements(elements)
    elements.each do |_key, item|
      world_environments.create(
        environment_id: item[:world_environment][:environment_id],
        position_x: item[:world_environment][:position_x],
        position_y: item[:world_environment][:position_y]
      )
    end
  end
end
