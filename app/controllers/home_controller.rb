class HomeController < ApplicationController
  before_action :to_lobby_if_logged

  def index
    @champion_classes = HeroRole.all
  end

  def to_lobby_if_logged
    redirect_to lobby_index_path if current_user
  end
end
