module Api
  module V1
    class ItemsController < ApiController
      def index
        respond_with Item.all
      end

      def show
        respond_with Item.find(params[:id])
      end

      def create
        respond_with Item.create(
          name: params[:name],
          description: params[:description],
          image_url: params[:image_url],
          )
      end

      def destroy
        respond_with Item.find(params[:id]).destroy
      end
    end
  end
end
