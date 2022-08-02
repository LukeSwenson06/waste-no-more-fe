require 'rails_helper' 

RSpec.describe Item do

  before :each do
    json = JSON.parse(File.read('./spec/fixtures/items_data.json'), symbolize_names: true) 
    @items = json[:data].map do |item_data|
      Item.new(item_data)
    end
  end

  it 'exists' do
    item1 = @items.first
    expect(@items).to be_all(Item)
    expect(item1.name).to be_a(String)
    expect(item1.expiration_date).to be_a(String)
    expect(item1.id).to be_a(Integer)
  end

  context 'instance methods' do
    context 'days_to_expired' do
      it 'returns how many days until the item will expire' do 
        item1 = @items.first
        expect(item1.days_to_expired("26/07/2022")).to eq(7)
        expect(item1.days_to_expired("06/12/2022")).to eq(-126)
      end
    end
  end
end