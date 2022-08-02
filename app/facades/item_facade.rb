class ItemFacade 
    def self.create_item(user_email, item_parameters)
        response = ItemService.create_item_call(user_email, item_parameters)
        json = JSON.parse(response.body, symbolize_names: true)
        if json[:errors].present?
            Error.new(json[:errors])
        else
            Item.new(json[:data][:attributes])
        end
    end

    def self.delete_item(id)
        ItemService.delete_item_call(id)
    end
end