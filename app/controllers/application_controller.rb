class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def auth_developer
    redirect_to root_path unless current_user.developer
  end
end
