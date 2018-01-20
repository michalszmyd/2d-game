class DeveloperPresenter
  def worlds
    World.all
  end

  def items
    Item.all
  end

  def environments
    Environment.all
  end

  def teleports
    Teleport.all
  end

  def hero_roles
    HeroRole.all
  end
end
