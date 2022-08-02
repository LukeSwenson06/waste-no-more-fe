class Article 

    attr_reader :header, :url
    def initialize(article)
        @header = article[:abstract]
        @url = article[:web_url]
    end
end