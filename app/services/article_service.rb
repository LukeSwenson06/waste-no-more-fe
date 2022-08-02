class ArticleService 

    def self.conn 
        Faraday.new(url: "https://api.nytimes.com") do |faraday|
            faraday.params['api-key'] = ENV['article_api_key']
        end
    end

    def self.get_articles
        response = conn.get('/svc/search/v2/articlesearch.json?fq=headline: ("Food Bank")')
        data = JSON.parse(response.body, symbolize_names: true)
    end
end