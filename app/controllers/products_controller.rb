class ProductsController < ApplicationController
  def index
    if params[:product].include?(" ")
      @products = Product.all_by_long(params[:product])

    else
      @products = Product.all(params[:product])
    end
  end
end
