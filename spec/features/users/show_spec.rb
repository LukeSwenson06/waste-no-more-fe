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

      recipe_json = JSON.parse(File.read('./spec/fixtures/recipe_data.json'), symbolize_names: true) 
      recipes = recipe_json[:data].map do |recipe_data|
        Recipe.new(recipe_data)
      end
      allow(RecipeFacade).to receive(:find_recipes).and_return(recipes)
    end
    it 'displays user name and welcome message if the user has an account' do
      visit '/dashboard'

      expect(page).to have_content("Hello, #{@user.name}! Welcome To Your Fridge")
    end

    it 'displays the items and the days until they expire in expired and expiring sections in the users fridge' do
      allow(Date).to receive(:today).and_return Date.new(2022, 8, 25)

      visit '/dashboard'

      expect(page).to have_content("Expired Items")
      expect(page).to have_content("Expiring Items")
      expect(page).to have_content("Fresh Items")
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
      within "#Fresh" do
        expect(page).to have_content("Peanut Butter")
        expect(page).to have_content("05/12/2022")
        expect(page).to_not have_content("Cheese")
        expect(page).to_not have_content("Chicken")
      end
    end

    it "displays recipes informaiton", :vcr do
      recipe_json = JSON.parse(File.read('./spec/fixtures/recipe_data.json'), symbolize_names: true) 
      recipe = recipe_json[:data].first
      visit '/dashboard'

      expect(page).to have_content('Recipe Suggestions')
      expect(page).to have_content('Buffalo Chicken Wings Wonton Wraps')
      expect(page).to have_content('Likes: 5')
      expect(page).to have_content('Fridge Ingredient(s) Count: 3')
      expect(page).to have_content('Missing Ingredient(s) Count: 2')

      expect(page).to have_content('How to Make an Easy Chicken Enchilada')
      expect(page).to have_content('Likes: 1')
      expect(page).to have_content('Fridge Ingredient(s) Count: 3')
      expect(page).to have_content('Missing Ingredient(s) Count: 4')

      click_link 'Buffalo Chicken Wings Wonton Wraps'
      expect(current_path).to eq("/recipes/#{recipe[:id]}") 
    end

    it 'has buttons to delete an item and redirects to dashboard after deletion', :vcr do
      allow(Date).to receive(:today).and_return Date.new(2022, 8, 25)
      visit '/dashboard'
      within "#Expiring" do
        expect(page).to have_content("Cheese")
        expect(page).to have_content("26/08/2022")
        expect(page).to have_button("Delete Item")
        click_button("Delete Item")
      end
    
      expect(current_path).to eq('/dashboard')
    end

    it 'has a delete all exired items button', :vcr do
      allow(Date).to receive(:today).and_return Date.new(2022, 8, 25)
      visit '/dashboard'
      
      expect(page).to have_button("Delete All Expired Items")
      within "#Expired" do
        expect(page).to have_content("Chicken")
        expect(page).to have_content("02/08/2022")
        expect(page).to have_content("Beef")
        expect(page).to have_content("02/08/2022")
      end
      click_button("Delete All Expired Items")
    
      expect(current_path).to eq('/dashboard')
    end

  end

  context 'Sad Path' do
    it 'redirects to login page and displays flash message if user is not logged in', :vcr do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(nil)
      
      visit '/dashboard'

      expect(current_path).to eq('/')
      expect(page).to have_content('Please login to view your dashboard')
    end

    it 'only displays the welcome message if the user does not have any items', :vcr do
      user = User.new({name: "Bill", email: "Bill@gmail.com"})
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      allow(UserFacade).to receive(:user_items).and_return([])
      
      visit '/dashboard'

      expect(current_path).to eq('/dashboard')
      expect(page).to_not have_content("Recipe Suggestions")
      expect(page).to_not have_content("Expired Items")
      expect(page).to_not have_content("Expiring Items")
      expect(page).to_not have_content("Fresh Items")
    end

    it 'only displays titles for sections that have items', :vcr do
      allow(Date).to receive(:today).and_return Date.new(2022, 8, 25)
      user = User.new({name: "Bill", email: "Bill@gmail.com"})
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      json = JSON.parse(File.read('./spec/fixtures/limited_items_data.json'), symbolize_names: true) 
      items = json[:data].map do |item_data|
        Item.new(item_data)
      end
      allow(UserFacade).to receive(:user_items).and_return(items)

      visit '/dashboard'
      expect(page).to have_content("Expiring Items")
      expect(page).to have_content("Fresh Items")
      expect(page).to_not have_content("Expired Items")
      expect(page).to_not have_button("Delete All Expired Items")
    end
  end


end