class RecipeSearchController < ApplicationController
    def index
      if params[:ingredient1] != nil || params[:ingredient2] != nil || params[:ingredient3] != nil || params[:ingredient4] != nil || params[:ingredient5] != nil
        @recipes = RecipeFacade.find_recipes_by_ingredients_string([params[:ingredient1], params[:ingredient2], params[:ingredient3], params[:ingredient4], params[:ingredient5]])
      else
        @recipes = RecipeFacade.find_recipes_by_name(params[:name])
      end
    end

    def show

    end
end
