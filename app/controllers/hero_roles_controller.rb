class HeroRolesController < ApplicationController
  before_action :auth_developer
  before_action :set_role, only: %i[edit update destroy]

  def new
    @hero_role = HeroRole.new
  end

  def edit; end

  def create
    @hero_role = HeroRole.new(hero_role_params)
    if @hero_role.save
      redirect_to developer_index_path
    else
      render :new
    end
  end

  def update
    if @hero_role.update(hero_role_params)
      redirect_to developer_index_path
    else
      render :edit
    end
  end

  def destroy
    if @hero_role.destroy
      redirect_to developer_index_path
    else
      render :back
    end
  end

  private

  def set_role
    @hero_role = HeroRole.find(params[:id])
  end

  def hero_role_params
    params.require(:hero_role).permit(:name, :template)
  end
end
