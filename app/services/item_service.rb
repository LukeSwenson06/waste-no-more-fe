class ItemService < BaseService
    def self.create_item_call(user_email, item_parameters)
        respoonse = connection.post("/api/v1/items/create"), {
            name: item_parameters[:name],
            expiration_date: item_parameters[:expiration_date]
        }
    end
    
end