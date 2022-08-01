require 'rails_helper'

RSpec.describe 'RecipeService' do
  it "can retrieve data and parses response for ingredients connection", :vcr do
    json = JSON.parse(File.read('./spec/fixtures/items_data.json'), symbolize_names: true) 
    ingredients = json[:data].map do |item_data|
      Item.new(item_data)
    end
    parsed_json = RecipeService.find_recipes_call(ingredients)

    expect(parsed_json).to be_a Array
    recipe = parsed_json.first

    expect(recipe).to include(:id, :title, :image, :imageType, :usedIngredientCount, :missedIngredientCount, :missedIngredients)
    expect(recipe).to be_a Hash
  end

  it "can retrieve data and parses response for searching recipe by id", :vcr do
    parsed_json = RecipeService.recipe_details_call(991625)

    expect(parsed_json).to be_a Hash
    expect(parsed_json).to include(:id, :title, :sourceUrl, :vegan, :vegetarian, :healthScore)
  end
end