RSpec.describe DishIngredient do
  describe 'relationships' do
    it { should belong_to :dishes }
    it { should belong_to :ingredients }
  end
end
