class WorldEditorPresenter
  def initialize(world_id)
    @world = World.find(world_id)
  end

  def world
    @world
  end

  def environments
    @environments ||= Environment.all
  end
end
