RSpec.describe 'As a visitor' do
  describe 'When I visit a dish\'s show page' do

    before :each do
      @chef = Chef.create!(name: 'Robin')
      @tom_kha = @chef.dishes.create!(name: 'Tom Kha Gai', description: 'Spicy, thai coconut soup')

      @coconut_milk = Ingredient.create!(name: 'Coconut Milk', calories: 100)
      @lemongrass = Ingredient.create!(name: 'Lemongrass', calories: 10)
      @tofu = Ingredient.create!(name: 'Tofu', calories: 200)
      @chili = Ingredient.create!(name: 'Chili Pepper', calories: 5)

      DishIngredients.create!(dish_id: @tom_kha.id, ingredient_id: @coconut_milk.id)
      DishIngredients.create!(dish_id: @tom_kha.id, ingredient_id: @lemongrass.id)
      DishIngredients.create!(dish_id: @tom_kha.id, ingredient_id: @tofu.id)
      DishIngredients.create!(dish_id: @tom_kha.id, ingredient_id: @chili.id)
    end

    it 'I see a list of ingredients for that dish and the chef\'s name' do

      visit "/dishes/#{@dish.id}"

      expect(page).to have_content('Lemongrass')
      expect(page).to have_content('Coconut Milk')
      expect(page).to have_content('Chili Pepper')
      expect(page).to have_content('Tofu')
    end
  end
end