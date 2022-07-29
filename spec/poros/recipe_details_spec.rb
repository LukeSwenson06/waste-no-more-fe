require 'rails_helper' 

RSpec.describe RecipeDetails do

  before :each do
    json = JSON.parse(File.read('./spec/fixtures/recipe_details_data.json'), symbolize_names: true) 
    @recipe = RecipeDetails.new(json)
  end

  it 'exists' do
    expect(@recipe).to be_a(RecipeDetails)
    expect(@recipe.title).to be_a(String)
    expect(@recipe.vegetarian).to be_in([true, false])
    expect(@recipe.vegan).to be_in([true, false])
    expect(@recipe.dairy_free).to be_in([true, false])
    expect(@recipe.gluten_free).to be_in([true, false])
    expect(@recipe.sustainable).to be_in([true, false])
    expect(@recipe.health_score).to be_a(Integer)
    expect(@recipe.ready_minutes).to be_a(Integer)
    expect(@recipe.servings).to be_a(Integer)
    expect(@recipe.url).to be_a(String)
    expect(@recipe.image).to be_a(String)
    expect(@recipe.summary).to be_a(String)
    expect(@recipe.wine_pairings).to be_a(Array)

  end
end