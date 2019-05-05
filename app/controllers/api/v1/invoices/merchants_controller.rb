class Api::V1::Invoices::MerchantsController < ApplicationController
  def show
    render json: MerchantSerializer.new(Merchant.merchant_to_invoice_find(params[:invoice_id]))
  end
end
