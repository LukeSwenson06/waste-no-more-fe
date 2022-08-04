require 'rails_helper'

RSpec.describe 'Add new item to fridge' do
    describe "happy path" do
        before :each do
            user = User.new({name: "Tom", email: "Tom@gmail.com"})
            allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
            json = JSON.parse(File.read('./spec/fixtures/groceries_data.json'), symbolize_names: true) 
            groceries = json[:data].map do |grocery_data|
                Grocery.new(grocery_data)
            end
            allow(UserFacade).to receive(:user_groceries).and_return(groceries)
        end

        it "has a form to add a new grocery" do
            visit '/groceries'
            fill_in :name, with: 'Spinach'
            click_button 'Add Grocery'
            expect(current_path).to eq(grocery_path)
            expect(page).to have_content('Spinach') 
        end
        it "has a button to delete a new grocery" do
            visit '/groceries'
            fill_in :name, with: 'Spinach'
            click_button 'Add Grocery'
            expect(current_path).to eq(grocery_path)
            expect(page).to have_content('Spinach')
            click_button 'Remove Spinach'
            expect(current_path).to eq(grocery_path)
            expect(page).to_not have_content('Spinach') 
        end
    end
end