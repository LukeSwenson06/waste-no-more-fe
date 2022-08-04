class BaseService 
    def self.local_connection
      # Faraday.new(url: 'https://waste-no-more-be.herokuapp.com')
      Faraday.new(url: 'http://localhost:3000')
    end

    def self.spoonacular_connection
        Faraday.new(url: 'https://api.spoonacular.com')
    end
    
end