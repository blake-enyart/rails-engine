class Api::V1::Merchants::SearchController < ApplicationController

  def show
    render json: MerchantSerializer.new(Merchant.where(merchant_params).first)
  end

  def index
    render json: MerchantSerializer.new(Merchant.where(merchant_params))
  end

  private

    def merchant_params
      params.permit(:id, :name, :created_at, :updated_at)
    end
end
