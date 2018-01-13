class LobbyController < ApplicationController
  before_action :authenticate_user!
  # before_action :check_hero, only: :show

  def index
    @user_heroes = current_user.heroes
  end

  def show; end

  def update_selected_hero; end
end
