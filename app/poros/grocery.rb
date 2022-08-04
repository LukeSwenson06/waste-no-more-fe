class Grocery
  attr_reader :name, :id

  def initialize(grocery_data)
    @id = grocery_data[:id]
    @name = grocery_data[:name]
  end
end