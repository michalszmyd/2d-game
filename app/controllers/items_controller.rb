class ItemsController < ApplicationController
  before_action :auth_developer
  before_action :set_item, only: %i[edit update destroy]

  def new
    @item = Item.new
  end

  def edit; end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to developer_index_path
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to developer_index_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to developer_index_path
    else
      render :back
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :wear_place, :damage,
                                 :mana, :armor, :hero_role_id,
                                 :image)
  end
end
