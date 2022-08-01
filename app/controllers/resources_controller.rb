class ResourcesController < ApplicationController 

    def index
        @articles = ArticleService.get_articles
    end

end