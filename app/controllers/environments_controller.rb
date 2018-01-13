class EnvironmentsController < ApplicationController
  before_action :auth_developer
  before_action :set_environment, only: %i[edit update destroy]

  def new
    @environment = Environment.new
  end

  def edit; end

  def create
    @environment = Environment.new(environment_params)
    if @environment.save
      redirect_to developer_index_path
    else
      render :new
    end
  end

  def update
    if @environment.update(environment_params)
      redirect_to developer_index_path
    else
      render :edit
    end
  end

  def destroy
    if @environment.destroy
      redirect_to developer_index_path
    else
      render :back
    end
  end

  private

  def set_environment
    @environment = Environment.find(params[:id])
  end

  def environment_params
    params.require(:environment).permit(:name)
  end
end
