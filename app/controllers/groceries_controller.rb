class GroceriesController < ApplicationController
    def index
        @groceries = UserFacade.user_groceries(session[:email])
    end

    def create
        if GroceryFacade.create_grocery(current_user.email, params[:name])
            redirect_to "/groceries"
        else
            redirect_to "/groceries"
            flash[:error] = "To add a grocery, please fill out a name."
        end
    end

    def destroy
        GroceryFacade.delete_grocery(params[:id])
        redirect_to '/groceries'
    end
    
end