class Api::V1::Merchants::InvoicesController < ApplicationController
  def index
    render json: InvoiceSerializer.new(Merchant.find(params[:id]).invoices.order(:id))
  end
end
