class RecipeDetails
    attr_reader :title,
                :vegetarian,
                :vegan,
                :gluten_free,
                :dairy_free,
                :sustainable,
                :health_score,
                :ready_minutes,
                :servings,
                :url,
                :image,
                :summary,
                :wine_pairings

    def initialize(data)
      @title = data[:title]
      @vegetarian = data[:vegetarian]
      @vegan = data[:vegan]
      @gluten_free = data[:glutenFree]
      @dairy_free = data[:dairyFree]
      @sustainable = data[:sustainable]
      @health_score = data[:healthScore]
      @ready_minutes = data[:readyInMinutes]
      @servings = data[:servings]
      @url = data[:sourceUrl]
      @image = data[:image]
      @summary = data[:summary]
      @wine_pairings = data[:winePairing][:pairedWines]
    end
end
