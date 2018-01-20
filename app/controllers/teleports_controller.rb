class TeleportsController < ApplicationController
  before_action :auth_developer
  before_action :set_teleport, only: %i[edit update destroy]

  def new
    @teleport = Teleport.new
  end

  def edit; end

  def create
    @teleport = Teleport.new(teleport_params)
    if @teleport.save
      redirect_to developer_index_path
    else
      render :new
    end
  end

  def update
    if @teleport.update(teleport_params)
      redirect_to developer_index_path
    else
      render :edit
    end
  end

  def destroy
    if @teleport.destroy
      redirect_to developer_index_path
    else
      render :back
    end
  end

  private

  def set_teleport
    @teleport = Teleport.find(params[:id])
  end

  def teleport_params
    params.require(:teleport).permit(:name, :world_id, :image)
  end
end
