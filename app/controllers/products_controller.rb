class ProductsController < ApplicationController
  def index
    @products = Product.all(params[:product])
  end
end
