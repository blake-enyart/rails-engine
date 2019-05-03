class Api::V1::InvoiceItems::InvoicesController < ApplicationController
  def show
    render json: InvoiceSerializer.new(Invoice.joins(:invoice_items).where(invoice_items: {id: params[:invoice_item_id]}).first)
  end
end
