class RecipeFacade
    def self.find_recipes(ingredients)
        json = RecipeService.find_recipes_call(ingredients)
        if json.is_a?(Hash) && json[:code] == 402
            return nil
        else
            json.map do |recipe|
                Recipe.new(recipe)
            end
        end
    end

    def self.find_recipes_by_ingredients_string(ingredients)
        json = RecipeService.find_recipes_by_ingredients_string_call(ingredients)
        if json.is_a?(Hash) && json[:code] == 402
            return nil
        else
            json.map do |recipe|
                Recipe.new(recipe)
            end
        end
    end

    def self.find_recipes_by_name(name)
        json = RecipeService.find_recipes_by_name_call(name)
        if json.is_a?(Hash) && json[:code] == 402
            return nil
        else
            json[:results].map do |recipe|
                SearchRecipe.new(recipe)
            end
        end
    end

    def self.recipe_details(id)
        json = RecipeService.recipe_details_call(id)
        if json.is_a?(Hash) && json[:code] == 402
            return nil
        else
            RecipeDetails.new(json)
        end
    end

end
