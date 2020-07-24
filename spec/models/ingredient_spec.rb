RSpec.describe Ingredient do
  describe 'validations' do
    it { should validate_presence_of :calories }
  end
  
  describe 'relationships' do
    it { should have_many :dish_ingredients }
    it { should have_many(:dishes).through(:dish_ingredients)}
  end
end
