require 'rails_helper' 

RSpec.describe UserFacade do

  it 'can create and find a user', :vcr do
    auth_hash = {:info => {:name => "Tom", :email => "Tom@gmail.com"}}
    UserFacade.create_user(auth_hash)
    user = UserFacade.find_user("Tom@gmail.com")
    expect(user).to be_a(User)
    expect(user.name).to eq("Tom")
    expect(user.email).to eq("Tom@gmail.com")
  end

  it 'can find a users items' do
    
  end
end