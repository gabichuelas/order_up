# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
