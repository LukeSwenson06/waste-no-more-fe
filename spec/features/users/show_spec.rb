require 'rails_helper'

RSpec.describe 'User dashboard' do

  it 'displays user name and Fridge' do
    user = User.new({name: "Tom", email: "Tom@gmail.com"})

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/dashboard'

    expect(page).to have_content("Hello, #{user.name}! Welcome To Your Fridge")
  end
end