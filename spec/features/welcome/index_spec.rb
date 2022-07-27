require 'rails_helper'

RSpec.describe "Welcome page" do

  it 'has a link to login which uses OAuth and redirects to user show page once logged in' do
    visit '/'

    expect(page).to have_button('Login With Google')
    expect(page).to have_content('Waste No More')

  end

end