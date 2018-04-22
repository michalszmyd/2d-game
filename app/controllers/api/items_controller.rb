module Api
  class ItemsController < ApplicationController
    def index
      render json: current_user.selected_hero.items.as_json
    end

    def wear
      hero = current_user.selected_hero
      to_wear = hero.hero_items.find(params[:id])
      if to_wear.present?
        true
      else
        render json: {}, status: :unprocessable_entity
      end
    end
  end
end
