class ItemsController < ApplicationController
    def new
        
    end
    
    def create
        item = ItemFacade.create_item(current_user.email, item_params)
        if item.instance_of?(Item)
            redirect_to "/dashboard"
        else
            redirect_to new_item_path
            flash[:error] = "To add an item, please fill out all fields of the form."
        end
    end

    private

    def item_params
        params.permit(:name, :expiration_date)
    end
    
    
end