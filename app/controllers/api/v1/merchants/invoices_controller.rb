class Api::V1::Merchants::InvoicesController < ApplicationController
  def index
    render json: InvoiceSerializer.new(Invoice.merchant_find(params[:merchant_id]))
  end
end
