class Api::V1::InvoiceItems::InvoicesController < ApplicationController
  def show
    render json: InvoiceSerializer.new(Invoice.invoice_to_invoice_item_find(params[:invoice_item_id]))
  end
end
