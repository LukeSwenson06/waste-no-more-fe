class RecipeFacade
    def self.find_recipes(ingredients)
        json = RecipeService.find_recipes_call(ingredients)
        json.map do |recipe|
            Recipe.new(recipe)
        end
    end

    def self.find_recipes_by_ingredients_string(ingredients)
        json = RecipeService.find_recipes_by_ingredients_string_call(ingredients)
        json.map do |recipe|
            Recipe.new(recipe)
        end
    end

    def self.find_recipes_by_name(name)
        json = RecipeService.find_recipes_by_name_call(name)
        json[:results].map do |recipe|
            SearchRecipe.new(recipe)
        end
    end

    def self.recipe_details(id)
        json = RecipeService.recipe_details_call(id)
        RecipeDetails.new(json)
    end

end
