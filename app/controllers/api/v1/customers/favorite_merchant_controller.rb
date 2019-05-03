class Api::V1::Customers::FavoriteMerchantController < ApplicationController
  def show
    render json: MerchantSerializer.new(Customer.favorite_merchant(params[:customer_id]))
  end
end
