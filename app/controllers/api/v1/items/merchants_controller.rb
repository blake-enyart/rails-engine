class Api::V1::Items::MerchantsController < ApplicationController
  def show
    render json: MerchantSerializer.new(Merchant.item_to_merchant_find(params[:item_id]))
  end
end
