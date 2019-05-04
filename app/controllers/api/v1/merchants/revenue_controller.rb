class Api::V1::Merchants::RevenueController < ApplicationController
  def show
    if params[:merchant_id] && params[:date]
      render json: OneMerchantRevenueSerializer.new(Merchant.total_revenue_one_merchant_date(params[:merchant_id], params[:date]))
    elsif params[:merchant_id]
      render json: OneMerchantRevenueSerializer.new(Merchant.most_revenue_for_merchant(params[:merchant_id]))
    elsif params[:date]
      render json: RevenueSerializer.new(Merchant.total_revenue_date(params[:date]))
    end
  end
end
