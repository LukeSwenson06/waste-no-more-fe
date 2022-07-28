class ItemFacade 
    def self.create_item(user_email, item_parameters)
        json = ItemService.create_item_call(user_email, item_parameters)
        if json[:errors].present?
            Error.new(json[:errors])
        else
            Item.new(json[:data])
        end
    end
end