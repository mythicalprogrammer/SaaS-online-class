class Dessert
  def initialize(name, calories)
    @name = name
    @calories = calories
  end
  attr_accessor :name 
  attr_accessor :calories
  def healthy?
    if self.calories < 200
      true
    else
      false
    end
  end
  def delicious?
    true
  end
end

class JellyBean < Dessert
  def initialize(name, calories, flavor)
    @name = name
    @calories = calories
    @flavor = flavor
  end
  attr_accessor :flavor
  def delicious?
    if self.flavor.downcase == "black licorice"
      false
    else
      true
    end
  end
end
