class Api::V1::Merchants::SearchController < ApplicationController
  def show
    if params[:random]
      render json: MerchantSerializer.new(Merchant.sample)
    else
      render json: MerchantSerializer.new(Merchant.where(merchant_params).first)
    end
  end

  def index
    render json: MerchantSerializer.new(Merchant.where(merchant_params))
  end

  private

    def merchant_params
      params.permit(:id, :name, :created_at, :updated_at)
    end
end
