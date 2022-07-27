require 'rails_helper'

RSpec.describe 'User dashboard' do

  context 'Happy Path' do
    it 'displays user name and Fridge' do
      user = User.new({name: "Tom", email: "Tom@gmail.com"})

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/dashboard'

      expect(page).to have_content("Hello, #{user.name}! Welcome To Your Fridge")
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