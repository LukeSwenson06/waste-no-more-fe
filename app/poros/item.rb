class Item
    attr_reader :name, :expiration_date

    def initialize(data)
      @name = data[:name]
      @expiration_date = data[:expiration_date]
    end
end