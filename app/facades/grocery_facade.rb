class GroceryFacade 
    def self.create_grocery(user_email, grocery_parameter)
        response = GroceryService.create_grocery_call(user_email, grocery_parameter)
         
        json = JSON.parse(response.body, symbolize_names: true)
        if json[:errors].present?
            Error.new(json[:errors])
        end
    end

    def self.delete_grocery(id)
        GroceryService.delete_grocery_call(id)
    end
end