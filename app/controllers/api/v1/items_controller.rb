module Api
  module V1
    class ItemsController < ApiController
      def index
        respond_with Item.all
      end
    end
  end
end
