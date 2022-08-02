require 'rails_helper'

RSpec.describe 'Recipe Show Page' do
  describe "happy path" do
    before :each do
      @user = User.new({name: "Tom", email: "Tom@gmail.com"})
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      json = JSON.parse(File.read('./spec/fixtures/items_data.json'), symbolize_names: true)
      items = json[:data].map do |item_data|
        Item.new(item_data)
      end
      @recipe = JSON.parse(File.read('./spec/fixtures/recipe_details_data.json'), symbolize_names: true)
    end

    it "displays all the recipes attributes", :vcr do

      summary = "Buffalo Chicken Wings Wonton Wraps might be just the hor d'oeuvre you are searching for. 
      One portion of this dish contains roughly 2g of protein, 1g of fat, and a total of 39 calories. This recipe serves 20 and costs 13 cents per serving.
      5 people have tried and liked this recipe. It is perfect for The Super Bowl. Head to the store and pick up wonton wrappers, hot sauce, weight cheddar cheese, and a few other things to make it today.
      Not a lot of people really liked this Chinese dish. It is brought to you by Foodista. From preparation to the plate, this recipe takes around around 45 minutes. All things considered, we decided this recipe deserves a spoonacular score of 7%.
      This score is very bad (but still fixable). Similar recipes include Skinny Buffalo Chicken Wonton Cups, Veggie Pizzan and Buffalo Chicken Salad Wonton Cup Appetizers, and Buffalo Chicken Wings."

      visit "/recipes/#{@recipe[:id]}"
      expect(page).to have_content(@recipe[:title])
      # expect(page).to have_content(strip_tags(@recipe[:summary]))
      expect(page).to have_content(summary)
      expect(page).to have_content(@recipe[:vegetarian])
      expect(page).to have_content(@recipe[:vegan])
      expect(page).to have_content(@recipe[:glutenFree])
      expect(page).to have_content(@recipe[:dairyFree])
      expect(page).to have_content(@recipe[:healthScore])
      expect(page).to have_content(@recipe[:readyInMinutes])
      expect(page).to have_content("Recipe Instructions")
    end
      end

  describe "sad path" do
    it "when a recipe has no wine pairings, it will display message", :vcr do
      @recipe = JSON.parse(File.read('./spec/fixtures/recipe_details_data_sad_path.json'), symbolize_names: true)
      visit "/recipes/#{@recipe[:id]}"

      expect(page). to have_content("There are no wine pairings for this recipe")
    end

  end
end
