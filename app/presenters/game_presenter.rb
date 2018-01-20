class GamePresenter
  def initialize(user)
    @user = user
    @playing_hero = playing_hero
    @world = world
  end

  def world
    @world ||= @user.selected_hero.world
  end

  def playing_hero
    @playing_hero ||= @user.selected_hero
  end

  def world_objects
    @world.environment_objects
  end

  def world_teleports
    @world.teleport_objects
  end

  def inventory
    @playing_hero.items
  end

  def players
    world.heroes
  end
end
