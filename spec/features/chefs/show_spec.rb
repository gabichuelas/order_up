RSpec.describe 'As a visitor' do
  describe 'When I visit a chef\'s show page' do

    before :each do
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
    end

    it 'I see the name of that chef, and I see a link to view a list of all ingredients that this chef uses in their dishes' do

      visit "/chefs/#{@chef.id}"

      expect(page).to have_content('Robin')
    end

    it 'And I see a link to view a list of all ingredients that this chef uses in their dishes; When I click on that link I\'m taken to a chef\'s ingredient index page and I can see a unique list of names of all the ingredients that this chef uses' do

      visit "/chefs/#{@chef.id}"

      click_on 'See All Ingredients'
      expect(current_path).to eq("/chefs/#{@chef.id}/ingredients")

      expect(page).to have_content('Lemongrass').once
      expect(page).to have_content('Coconut Milk').once
      expect(page).to have_content('Chili Pepper').once
      expect(page).to have_content('Tofu').once

      expect(page).to have_content('Mango').once
      expect(page).to have_content('Rice').once
    end
  end
end
