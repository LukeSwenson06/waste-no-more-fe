class Item

  attr_reader :name, :expiration_date, :id

  def initialize(item_data)
    @name = item_data[:name]
    @expiration_date = item_data[:expiration]
    @id = item_data[:id]
  end

  def days_to_expired(current_date)
    (@expiration_date.to_date - current_date.to_date).to_i
  end

end