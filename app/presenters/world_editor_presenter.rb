class WorldEditorPresenter
  attr_reader :world

  def initialize(world_id)
    @world = World.find(world_id)
  end

  def environments
    @environments ||= Environment.all
  end

  def teleports
    @teleports ||= Teleport.all
  end

  def world_environment
    @environment_values ||= @world.world_objects
  end
end
