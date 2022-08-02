class ResourcesController < ApplicationController 

    def index
        @articles = ArticleFacade.get_articles
    end

end