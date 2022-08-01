require 'rails_helper'

RSpec.describe 'Foodbank Service', :vcr do
  it 'retrieves search data and parses response', :vcr do

    parsed_json = FoodbankService.search_state('NY')
    expect(parsed_json).to be_a Array
    
    expect(parsed_json[0]).to be_a Hash

    foodbank = parsed_json.first

    expect(foodbank).to be_a Hash

  end

  it 'retrieves foodbank data and parses response', :vcr do

    parsed_json = FoodbankService.foodbank('742244826')
    
    expect(parsed_json).to be_a Hash

  end
end