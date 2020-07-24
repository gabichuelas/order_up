class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def ingredients
    dish_ingredients = self.dishes.reduce({}) do |acc, dish|
      acc[dish] ||= []
      acc[dish] = dish.ingredients
      acc
    end
    dish_ingredients.values.flatten
  end

  def unique_ingredients
    self.ingredients.uniq
  end

  def ingredient_names
    self.unique_ingredients.map do |ingredient|
      ingredient.name
    end
  end

  def popular_ingredients
    # ran out of time to figure this one out

    sort = self.ingredients.reduce({}) do |acc, ingredient|
      acc[ingredient] ||= 0
      acc[ingredient] += 1
      acc
    end
    sort.sort
  end
end
