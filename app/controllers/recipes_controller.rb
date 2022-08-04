class RecipesController < ApplicationController
    def show
        @recipe = RecipeFacade.recipe_details(params[:id])
    end  
end
