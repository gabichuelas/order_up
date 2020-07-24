RSpec.describe 'As a visitor' do
  describe 'When I visit a chef\'s show page' do

    before :each do
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
    end

    it 'I see the name of that chef, and I see a link to view a list of all ingredients that this chef uses in their dishes' do

      visit "/chefs/#{@chef.id}"

      expect(page).to have_content('Robin')
    end
  end
end
