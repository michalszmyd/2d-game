class World < ApplicationRecord
  has_attached_file :background, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :background, content_type: %r{\Aimage\/.*\z}

  has_many :world_environments, dependent: :destroy
  has_many :environments, through: :world_environments
  has_many :world_teleports, dependent: :destroy
  has_many :teleports, dependent: :destroy
  has_many :heroes, dependent: :nullify

  validates :name, :required_level, presence: true

  def environment_objects
    Environment.left_joins(:world_environments)
               .where('world_environments.world_id = ?', id)
               .select(
                 %(
                   environments.*,
                   world_environments.position_x,
                   world_environments.position_y
                  )
               )
  end

  def teleport_objects
    Teleport.left_joins(:world_teleports)
            .where('world_teleports.world_id = ?', id)
            .select(
              %(
                teleports.*,
                world_teleports.position_x,
                world_teleports.position_y
              )
            )
  end

  def insert_environment_elements(elements)
    elements.each do |_key, item|
      if item[:world_environment].present?
        world_environments.create(environment_values(:environment, item))
      elsif item[:world_teleport].present?
        world_teleports.create(environment_values(:teleport, item))
      end
    end
  end

  def environment_values(symbol, item)
    {
      :"#{symbol}_id" => item[:"world_#{symbol}"][:"#{symbol}_id"],
      position_x: item[:"world_#{symbol}"][:position_x],
      position_y: item[:"world_#{symbol}"][:position_y]
    }
  end
end
