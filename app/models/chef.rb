class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def ingredients
    dish_ingredients = self.dishes.reduce({}) do |acc, dish|
      acc[dish] ||= []
      acc[dish] = dish.ingredients
      acc
    end
    dish_ingredients.values.flatten.uniq
  end

  def ingredient_names
    self.ingredients.map do |ingredient|
      ingredient.name
    end
  end
end
