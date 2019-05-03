class Api::V1::Invoices::InvoiceItemsController < ApplicationController
  def index
    render json: InvoiceItemSerializer.new(InvoiceItem.where(invoice_id: params[:invoice_id]))
  end
end
