class Item

  attr_reader :name, :expiration_date

  def initialize(item_data)
    # binding.pry
    @name = item_data[:name]
    @expiration_date = item_data[:expiration_date]
  end

  def days_to_expired(current_date)
    (@expiration_date.to_date - current_date.to_date).to_i
  end

end