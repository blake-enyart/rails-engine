class Api::V1::Merchants::FavoriteCustomerController < ApplicationController

  def show
    render json: CustomerSerializer.new(Merchant.best_customer_for_merchant(params[:merchant_id]))
  end
end
