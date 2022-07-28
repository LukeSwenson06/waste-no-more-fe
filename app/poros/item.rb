class Item

  attr_reader :name, :expiration_date

  def initialize(item_data)
    @name = item_data[:name]
    @expiration_date = item_data[:expiration_date]
  end

end