class WorldsController < ApplicationController
  before_action :auth_developer
  before_action :set_world, only: %i[edit update destroy]

  def new
    @world = World.new
  end

  def edit; end

  def create
    @world = World.new(world_params)
    if @world.save
      redirect_to developer_index_path
    else
      render :new
    end
  end

  def update
    if @world.update(world_params)
      redirect_to developer_index_path
    else
      render :edit
    end
  end

  def destroy
    if @world.destroy
      redirect_to developer_index_path
    else
      render :back
    end
  end

  private

  def set_world
    @world = World.find(params[:id])
  end

  def world_params
    params.require(:world).permit(:name, :height, :width, :background)
  end
end
