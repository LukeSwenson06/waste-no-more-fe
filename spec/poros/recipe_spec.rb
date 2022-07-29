require 'rails_helper' 

RSpec.describe Recipe do

  before :each do
    json = JSON.parse(File.read('./spec/fixtures/recipe_data.json'), symbolize_names: true) 
    @recipes = json[:data].map do |recipe_data|
      Recipe.new(recipe_data)
    end
  end

  it 'exists' do
    recipe1 = @recipes.first
    expect(@recipes).to be_all(Recipe)
    expect(recipe1.title).to be_a(String)
    expect(recipe1.image).to be_a(String)
    expect(recipe1.likes).to be_a(Integer)
    expect(recipe1.unused_ingredients).to be_a(Integer)
    expect(recipe1.used_ingredients).to be_a(Integer)
  end
end