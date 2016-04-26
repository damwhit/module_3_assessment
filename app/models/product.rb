class Product

  def self.service
    BestBuyService.new
  end

  def self.all(product_search)
    service.all(product_search)
  end
end
