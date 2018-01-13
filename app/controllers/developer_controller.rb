class DeveloperController < ApplicationController
  before_action :authenticate_user!, :auth_developer

  def index
    @presenter = DeveloperPresenter.new
  end
end
