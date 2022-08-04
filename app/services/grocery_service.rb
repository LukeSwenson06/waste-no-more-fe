class GroceryService < BaseService
    def self.create_grocery_call(user_email, grocery_parameter)
        response = local_connection.post("/api/v1/groceries?name=#{grocery_parameter}") do |req| 
            req.body = {
                data: { email: user_email }
            }
        end
    end

    def self.delete_grocery_call(id)
        response = local_connection.delete("/api/v1/groceries/#{id}")
    end
end