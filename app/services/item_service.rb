class ItemService < BaseService
    def self.create_item_call(user_email, item_parameters)
        response = local_connection.post("/api/v1/items?name=#{item_parameters[:name]}&expiration=#{item_parameters[:expiration_date]}") do |req| 
            req.body = {
                data: { email: user_email }
            }
        end
    end

    def self.delete_item_call(id)
        response = local_connection.delete("/api/v1/items/#{id}")
    end
end