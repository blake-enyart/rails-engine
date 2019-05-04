class Api::V1::Merchants::CustomersWithPendingInvoicesController < ApplicationController
  def index
    render json: CustomerSerializer.new(Merchant.customers_with_pending_invoices(params[:merchant_id]))
  end
end
