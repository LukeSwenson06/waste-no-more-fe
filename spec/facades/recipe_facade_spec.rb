require 'rails_helper'

RSpec.describe RecipeFacade do
  describe 'methods' do
    it 'returns a list of recipes', :vcr do
      json = JSON.parse(File.read('./spec/fixtures/items_data.json'), symbolize_names: true) 
      ingredients = json[:data].map do |item_data|
        Item.new(item_data)
      end
      recipes = RecipeFacade.find_recipes(ingredients)

      expect(recipes).to be_all(Recipe)
    end

    it 'returns details fo a recipe', :vcr do
      recipe_detials = RecipeFacade.recipe_details(991625)
      
      expect(recipe_detials).to be_a(RecipeDetails)
    end
  end
end
