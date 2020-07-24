require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  describe "instance methods" do
    it '#ingredients' do
      @chef = Chef.create!(name: 'Robin')
      @tom_kha = @chef.dishes.create!(name: 'Tom Kha Gai', description: 'Spicy, thai coconut soup')
      @pudding = @chef.dishes.create!(name: 'Thai Pudding', description: 'Sweet, sticky rice with mango and coconut milk')

      @coconut_milk = Ingredient.create!(name: 'Coconut Milk', calories: 100)
      @lemongrass = Ingredient.create!(name: 'Lemongrass', calories: 10)
      @tofu = Ingredient.create!(name: 'Tofu', calories: 200)
      @chili = Ingredient.create!(name: 'Chili Pepper', calories: 5)

      @mango = Ingredient.create!(name: 'Mango', calories: 50)
      @rice = Ingredient.create!(name: 'Rice', calories: 100)

      DishIngredient.create!(dish_id: @tom_kha.id, ingredient_id: @coconut_milk.id)
      DishIngredient.create!(dish_id: @tom_kha.id, ingredient_id: @lemongrass.id)
      DishIngredient.create!(dish_id: @tom_kha.id, ingredient_id: @tofu.id)
      DishIngredient.create!(dish_id: @tom_kha.id, ingredient_id: @chili.id)

      DishIngredient.create!(dish_id: @pudding.id, ingredient_id: @coconut_milk.id)
      DishIngredient.create!(dish_id: @pudding.id, ingredient_id: @rice.id)
      DishIngredient.create!(dish_id: @pudding.id, ingredient_id: @mango.id)

      expect(@chef.ingredient_names).to eq(['Coconut Milk', 'Lemongrass', 'Tofu', 'Chili', 'Rice', 'Mango'])
    end
  end
end
