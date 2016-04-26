class Product

  attr_reader :name,
              :sku,
              :customer_average_review,
              :sale_price,
              :image_url

  def initialize(data)
    @name = data[:name]
    @sku = data[:sku]
    @customer_average_review = data[:customerReviewAverage]
    @sale_price = data[:salePrice]
    @image_url = data[:image]
  end

  def self.service
    BestBuyService.new
  end

  def self.all(product_search)
    service.all(product_search)[:products].map {
      |product| Product.new(product)
    }
  end

  def self.all_by_long(long_search)
    modified = long_search.gsub(" ", "%20")
    service.all_by_long(modified)
  end
end
