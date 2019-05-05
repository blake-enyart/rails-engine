class Api::V1::Invoices::InvoiceItemsController < ApplicationController
  def index
    render json: InvoiceItemSerializer.new(InvoiceItem.invoice_find(params[:invoice_id]))
  end
end
