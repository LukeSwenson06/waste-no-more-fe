class ArticleFacade 
    def self.get_articles
        ArticleService.get_articles[:response][:docs].map { |article| Article.new(article) }
    end
end