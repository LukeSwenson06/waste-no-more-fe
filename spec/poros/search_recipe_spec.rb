require 'rails_helper'

RSpec.describe Recipe do

  before :each do
    json = JSON.parse(File.read('./spec/fixtures/search_recipe.json'), symbolize_names: true)
    @recipes = json[:results].map do |recipe|
      SearchRecipe.new(recipe)
    end
    binding.pry
  end

  it 'exists' do
    recipe1 = @recipes.first
    expect(@recipes).to be_all(SearchRecipe)
    expect(recipe1.title).to be_a(String)
    expect(recipe1.image).to be_a(String)
  end
end
