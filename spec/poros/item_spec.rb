require 'rails_helper' 

RSpec.describe Item do

  it 'exists' do
    json = JSON.parse(File.read('./spec/fixtures/items_data.json'), symbolize_names: true) 
    items = json[:data].map do |item_data|
      Item.new(item_data)
    end

    item1 = items.first
    expect(items).to be_all(Item)
    expect(item1.name).to be_a(String)
    expect(item1.expiration_date).to be_a(String)
  end
end