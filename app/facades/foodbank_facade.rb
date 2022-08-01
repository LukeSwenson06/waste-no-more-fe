class FoodbankFacade 
    def self.search_states(state)
        FoodbankService.search_state(state).map { |data| Foodbank.new(data) }
    end

    def self.foodbank_info(id)
        foodbank = Foodbank.new(FoodbankService.foodbank(id))
    end
end