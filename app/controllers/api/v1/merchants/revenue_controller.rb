class Api::V1::Merchants::RevenueController < ApplicationController
  def show
    render json: RevenueSerializer.new(Invoice.total_revenue_date(params[:date]))
  end
end
