require 'rails_helper'

RSpec.describe "Welcome page" do

  it 'has a link to login which uses OAuth and redirects to user show page once logged in' do
    OmniAuth.config.silence_get_warning = true
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
      :info => {
        :name => "Tom",
        :email => "tom@gmail.com"
      },
      :credentials => {
        :token => "123048139841983"
      }
    })
    user = User.new({name: "Tom", email: "Tom@gmail.com"})
    allow(UserFacade).to receive(:create_user).and_return(user)
    @user = User.new({name: "Tom", email: "Tom@gmail.com"})
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    allow(UserFacade).to receive(:user_items).and_return([])


    visit '/'

    expect(page).to have_link('Google Login')
    
    click_link("Google Login")
    expect(current_path).to eq('/dashboard')

    expect(page).to have_content("Hello, #{@user.name}! Welcome To Your Fridge")
    OmniAuth.config.test_mode = false
  end

  it 'has a link to login which uses OAuth and redirects to user show page once logged in' do
    OmniAuth.config.silence_get_warning = true
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      :info => {
        :name => "Tom",
        :email => "tom@gmail.com"
      },
      :credentials => {
        :token => "123048139841983"
      }
    })
    user = User.new({name: "Tom", email: "Tom@gmail.com"})
    allow(UserFacade).to receive(:create_user).and_return(user)
    @user = User.new({name: "Tom", email: "Tom@gmail.com"})
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    allow(UserFacade).to receive(:user_items).and_return([])


    visit '/'

    expect(page).to have_link('Twitter Login')
    
    click_link("Twitter Login")
    expect(current_path).to eq('/dashboard')
    
    expect(page).to have_content("Hello, #{@user.name}! Welcome To Your Fridge")
    OmniAuth.config.test_mode = false
  end
  
  describe "navigation bar" do
    it "has a link to log out" do
      OmniAuth.config.silence_get_warning = true
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
        :info => {
          :name => "Tom",
          :email => "tom@gmail.com"
        },
        :credentials => {
          :token => "123048139841983"
        }
        })
        user = User.new({name: "Tom", email: "Tom@gmail.com"})
        allow(UserFacade).to receive(:create_user).and_return(user)
        @user = User.new({name: "Tom", email: "Tom@gmail.com"})
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
        allow(UserFacade).to receive(:user_items).and_return([])


        visit '/'

        expect(page).to have_link('Google Login')
        
        click_link("Google Login")
        expect(current_path).to eq('/dashboard')
        expect(page).to have_content("Hello, #{@user.name}! Welcome To Your Fridge")
        OmniAuth.config.test_mode = false

        click_link 'Log Out'

        expect(current_path).to eq('/') 
    end

    it "has a link to resources", :vcr do
      visit '/'

      click_link 'Resources'

      expect(current_path).to eq('/resources') 
    end

    it "has a link to foodback index" do
      visit '/'

      click_link 'Foodbanks'

      expect(current_path).to eq('/foodbanks') 
    end
  end
  

end