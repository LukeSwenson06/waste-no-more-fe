require 'rails_helper'

RSpec.describe 'Add new grocery to list' do
    describe "happy path" do
        before :each do
            @user = User.new({name: "Tom", email: "Tom@gmail.com"})
            allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
            allow_any_instance_of(ApplicationController).to receive(:active_session?).and_return(true)
      

            json = JSON.parse(File.read('./spec/fixtures/groceries_data.json'), symbolize_names: true) 
            groceries = json[:data].map do |grocery_data|
                Grocery.new(grocery_data)
            end
            allow(UserFacade).to receive(:user_groceries).and_return(groceries)
        end
        
        it "has a form to add a new grocery", :vcr do
            # UserFacade.create_user({info: {name: 'Tom', nickname: 'Tom@gmail.com'}, credentials: {token: '123'}})
            
            visit '/groceries'
            fill_in :name, with: 'Spinach'
            click_button 'Add Grocery'
            expect(current_path).to eq(groceries_path)
        end

        it "has a button to delete a new grocery", :vcr do
            visit '/groceries'
            click_button 'Remove Cheese'
            expect(current_path).to eq(groceries_path)
        end
    end
end