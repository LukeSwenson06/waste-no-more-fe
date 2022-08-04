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

  it 'can find a users items', :vcr do
    auth_hash = {:info => {:name => "Tom", :email => "Tom@gmail.com"}}
    UserFacade.create_user(auth_hash)
    ItemFacade.create_item("Tom@gmail.com", {name: "Peanut", expiration_date: "08/05/22"})
    ItemFacade.create_item("Tom@gmail.com", {name: "Walnut", expiration_date: "08/05/22"})
    items = UserFacade.user_items("Tom@gmail.com")
    peanut = items[0]
    expect(items).to be_all(Item)
    expect(items.length).to eq(2)
    expect(peanut.name).to eq("Peanut")
  end
end