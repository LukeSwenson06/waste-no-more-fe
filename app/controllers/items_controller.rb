class ItemsController < ApplicationController
    def new
        
    end
    
    def create
        if ItemFacade.create_item(current_user.email, item_params)
            redirect_to "/dashboard"
        else
            redirect_to new_item_path
            flash[:error] = "To add an item, please fill out all fields of the form."
        end
    end

    def destroy
        if params[:items_ids]
            params[:items_ids].each do |id| 
                ItemFacade.delete_item(id)
            end
        else
            ItemFacade.delete_item(params[:id])
        end
        redirect_to '/dashboard'
    end

    private

    def item_params
        params.permit(:name, :expiration_date)
    end
    
    
end