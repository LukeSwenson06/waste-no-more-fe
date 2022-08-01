class User

  attr_reader :name, :email

  def initialize(data)
    # binding.pry
    @name = data[:name]
    @email = data[:email]
  end

end