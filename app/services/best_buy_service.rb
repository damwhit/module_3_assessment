class BestBuyService
  def initialize
    @_connection = Faraday.new(url: "http://api.bestbuy.com/v1/")
  end

  def all(product_search)
    parse(connection.get "products((search=#{product_search}))", {show: "name, sku, customerReviewAverage, shortDescription, salePrice, image", pageSize: "15", page: "1", format: "json", apiKey: key})
  end

  def all_by_long(long_search)
    c = parse(connection.get "products(longDescription=#{long_search})", {show: "name, sku, customerReviewAverage, shortDescription, salePrice, image", pageSize: "15", page: "1", format: "json", apiKey: key})
    require "pry"; binding.pry
  end

  private
    def connection
      @_connection
    end

    def key
      ENV['BEST_BUY_KEY']
    end

    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end
end
