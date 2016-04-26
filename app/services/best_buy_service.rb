class BestBuyService
  def initialize
    @_connection = Faraday.new(url: "http://api.bestbuy.com/v1/")
  end

  def all(product_search)
    connection.get do |req|
      req.url '/products'
      req.headers['search'] = product_search
      req.body = {show: "name, "}
  end "((search=touchscreen&search=apple)&salePrice<500&categoryPath.id=pcmcat209000050006)?show=name,sku,salePrice&format=json&apiKey=YourAPIKey"
  end

  private
    def connection
      @_connection
    end

    def key
      ENV['BEST_BUY_KEYBUYKEY']
    end
end
