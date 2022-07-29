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

        it "displays all the recipes attributes" do
            visit "/recipes/#{@recipe[:id]}"
            expect(page).to have_content(@recipe[:title]) 
            expect(page).to have_content(@recipe[:summary]) 
            expect(page).to have_content(@recipe[:vegetarian]) 
            expect(page).to have_content(@recipe[:vegan]) 
            expect(page).to have_content(@recipe[:glutenFree]) 
            expect(page).to have_content(@recipe[:dairyFree]) 
            expect(page).to have_content(@recipe[:healthScore]) 
            expect(page).to have_content(@recipe[:readyInMinutes]) 
            expect(page).to have_content("Recipe Instructions")        
        end
    
    end
end