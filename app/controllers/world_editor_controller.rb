class WorldEditorController < ApplicationController
  before_action :auth_developer

  def show
    @presenter = WorldEditorPresenter.new(params[:id])
  end

  def save_env
    world = World.find(params[:id])
    world.insert_environment_elements(params[:world_environments])
  end
end
