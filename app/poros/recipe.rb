class Recipe 
    attr_reader :id, :title, :image, :unused_ingredients, :used_ingredients, :likes
    
    def initialize(data)
      @id = data[:id]
      @title = data[:title]
      @image = data[:image]
      @unused_ingredients = data[:missedIngredientCount]
      @used_ingredients = data[:usedIngredientCount]
      @likes = data[:likes]
    end
end