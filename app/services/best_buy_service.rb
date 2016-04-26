class BestBuyService
  def initialize
    @_connection = Faraday.new(url: "http://api.bestbuy.com/v1/")
  end

  def all(product_search)
    # connection.get do |req|
    #   req.url 'products'
    #   req.headers['search'] = product_search
    #   req.body = {show: "name, sku, customerReviewAverage, shortDescription, salePrice, image", pageSize: "15", format: "json", apiKey: key}
    # end
    c = connection.get "products((search=#{product_search}))", {show: "name, sku, customerReviewAverage, shortDescription, salePrice, image", pageSize: "15", page: "1", format: "json", apiKey: key}

# http://api.bestbuy.com/v1/products((search=touchscreen&search=apple)&salePrice<500&categoryPath.id=pcmcat209000050006)?show=name,sku,salePrice&format=json&apiKey=YourAPIKey
    require "pry"; binding.pry
  end

  private
    def connection
      @_connection
    end

    def key
      ENV['BEST_BUY_KEY']
    end
end
