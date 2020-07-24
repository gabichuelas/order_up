require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it { should have_many :dish_ingredients }
    it { should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe "instance methods" do
    it '#calories' do
      @chef = Chef.create!(name: 'Robin')
      @tom_kha = @chef.dishes.create!(name: 'Tom Kha Gai', description: 'Spicy, thai coconut soup')

      @coconut_milk = Ingredient.create!(name: 'Coconut Milk', calories: 100)
      @lemongrass = Ingredient.create!(name: 'Lemongrass', calories: 10)
      @tofu = Ingredient.create!(name: 'Tofu', calories: 200)
      @chili = Ingredient.create!(name: 'Chili Pepper', calories: 5)

      DishIngredient.create!(dish_id: @tom_kha.id, ingredient_id: @coconut_milk.id)
      DishIngredient.create!(dish_id: @tom_kha.id, ingredient_id: @lemongrass.id)
      DishIngredient.create!(dish_id: @tom_kha.id, ingredient_id: @tofu.id)
      DishIngredient.create!(dish_id: @tom_kha.id, ingredient_id: @chili.id)

      expect(@tom_kha.calories).to eq(315)
    end
  end
end
