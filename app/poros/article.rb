class Article

    attr_reader :header, :url, :date
    def initialize(article)
        @header = article[:abstract]
        @url = article[:web_url]
        @date = article[:pub_date][0..9]
    end
end
