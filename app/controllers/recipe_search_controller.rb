class RecipeSearchController < ApplicationController
    def index
        @recipes = RecipeFacade.find_recipes_by_name(params[:recipe])
    end

    def show

    end
end
