class RecipeFacade 
    def self.find_recipes(ingredients)
        json = RecipeService.find_recipes_call(ingredients)
        json.map do |recipe|
            Recipe.new(recipe)
        end
    end
end