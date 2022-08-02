class RecipeService < BaseService
    def self.find_recipes_call(ingredients)
        ingredients_array = []
        ingredients.each do |ing|
            ingredients_array << ing.name
        end
        string = ingredients_array.join(",")
        response = spoonacular_connection.get("/recipes/findByIngredients?ingredients=#{string}") do |faraday|
            faraday.params['number'] = 10
            faraday.params['apiKey'] = ENV['recipe_api_key']
        end
        JSON.parse(response.body, symbolize_names: true)
    end

    def self.recipe_details_call(id)
        response = spoonacular_connection.get("/recipes/#{id}/information") do |faraday|
            faraday.params['apiKey'] = ENV['recipe_api_key']
        end
        JSON.parse(response.body, symbolize_names: true)
    end


end
