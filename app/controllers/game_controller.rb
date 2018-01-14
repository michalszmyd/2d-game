class GameController < ApplicationController
  before_action :authenticate_user!

  def index
    @presenter = GamePresenter.new(current_user)
    render layout: 'plain'
  end
end
