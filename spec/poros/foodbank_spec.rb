require 'rails_helper' 

RSpec.describe Foodbank, :vcr do

  before :each do
    @foodbanks = FoodbankFacade.search_states('NY')
  end

  it 'exists', :vcr do
    fb1 = @foodbanks.first
    expect(fb1.name).to be_a(String)
    expect(fb1.snippet).to be_a(String)
    expect(fb1.link).to be_a(String)
    expect(fb1.mission).to be_a(String)
    expect(fb1.street).to be_a(String)
  end
end