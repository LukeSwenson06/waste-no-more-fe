require 'rails_helper'

RSpec.describe 'User dashboard' do

  context 'Happy Path' do
    before :each do
      @user = User.new({name: "Tom", email: "Tom@gmail.com"})
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      json = JSON.parse(File.read('./spec/fixtures/items_data.json'), symbolize_names: true) 
      items = json[:data].map do |item_data|
        Item.new(item_data)
      end
      allow(UserFacade).to receive(:user_items).and_return(items)
    end
    it 'displays user name and welcome message' do
      visit '/dashboard'

      expect(page).to have_content("Hello, #{@user.name}! Welcome To Your Fridge")
    end

    it 'displays the items and the days until they expire in expired and expiring sections in the users fridge' do
      allow(Date).to receive(:today).and_return Date.new(2022, 8, 25)

      visit '/dashboard'

      expect(page).to have_content("Expired Items")
      within "#Expired" do
        expect(page).to have_content("Chicken")
        expect(page).to have_content("02/08/2022")
        expect(page).to_not have_content("Peanut Butter")
        expect(page).to_not have_content("Cheese")
      end
      within "#Expiring" do
        expect(page).to have_content("Cheese")
        expect(page).to have_content("26/08/2022")
        expect(page).to_not have_content("Peanut Butter")
        expect(page).to_not have_content("Chicken")
      end
      within "#Good" do
        expect(page).to have_content("Peanut Butter")
        expect(page).to have_content("05/12/2022")
        expect(page).to_not have_content("Cheese")
        expect(page).to_not have_content("Chicken")
      end
    end

    it "displays top 10 recipies" do
      recipe_json = JSON.parse(File.read('./spec/fixtures/recipe_data.json'), symbolize_names: true) 
      recipes = recipe_json[:data].map do |recipe_data|
        Recipe.new(recipe_data)
      end
      allow(RecipeFacade).to receive(:find_recipes).and_return(recipes)
      visit '/dashboard'

      expect(page).to have_content('Buffalo Chicken Wings Wonton Wraps')
      expect(page).to have_content('How to Make an Easy Chicken Enchilada')
    end
    
  end

  context 'Sad Path' do
    it 'redirects to login page and displays flash message if user is not logged in' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(nil)
      
      visit '/dashboard'

      expect(current_path).to eq('/')
      expect(page).to have_content('Please login to view your dashboard')
    end
  end


end