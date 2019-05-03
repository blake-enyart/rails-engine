class Api::V1::Invoices::MerchantsController < ApplicationController
  def show
    render json: MerchantSerializer.new(Merchant.joins(:invoices).where(invoices: {id: params[:invoice_id]}).first)
  end
end
