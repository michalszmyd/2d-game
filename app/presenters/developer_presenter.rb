class DeveloperPresenter
  def worlds
    World.all
  end

  def items
    Item.all
  end

  def environment
    Environment.all
  end

  def hero_roles
    HeroRole.all
  end
end
