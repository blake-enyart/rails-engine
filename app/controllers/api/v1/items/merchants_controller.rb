class Api::V1::Items::MerchantsController < ApplicationController
  def show
    render json: MerchantSerializer.new(Merchant.joins(:items).where(items: {id: params[:item_id]}).first)
  end
end
