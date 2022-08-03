class FoodbankService 
    def self.conn 
        Faraday.new(url: "https://api.data.charitynavigator.org") do |faraday|
            faraday.params['app_key'] = ENV['foodbank_app_key']
            faraday.params['app_id'] = ENV['foodbank_app_id']
        end
    end

    def self.search_state(state)
        response = conn.get("/v2/Organizations?&pageSize=25&pageNum=1&causeID=18&state=#{state}&sort=rating")
        binding.pry
        data = JSON.parse(response.body, symbolize_names: true)
    end

    def self.foodbank(id)
        response = conn.get("/v2/Organizations/#{id}")
        data = JSON.parse(response.body, symbolize_names: true)
        data
    end
end