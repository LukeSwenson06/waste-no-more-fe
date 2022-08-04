require 'rails_helper' 

RSpec.describe UserService do

  it 'can create and find a user', :vcr do
    auth_hash = {:info => {:name => "Tom", :email => "Tom@gmail.com"}}
    UserService.create_user_call(auth_hash)
    user = UserService.find_user_call("Tom@gmail.com")
    user_data = user[:data]
    user_attributes = user_data[:attributes]
    expect(user_attributes).to have_key(:name)
    expect(user_attributes).to have_key(:email)
  end
end