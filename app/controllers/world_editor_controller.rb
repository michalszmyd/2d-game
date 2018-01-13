class WorldEditorController < ApplicationController
  before_action :auth_developer

  def show
    @presenter = WorldEditorPresenter.new(params[:id])
  end
end
