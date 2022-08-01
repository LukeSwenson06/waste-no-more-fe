class User

  attr_reader :name, :email

  def initialize(data)
    @name = data[:name]
    @email = data[:email]
  end

end