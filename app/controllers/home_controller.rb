class HomeController < ApplicationController
  def index
    @champion_classes = HeroRole.all
  end
end
