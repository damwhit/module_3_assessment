class ProductsController < ApplicationController
  def index
    Product.all(params[:product])
  end
end
