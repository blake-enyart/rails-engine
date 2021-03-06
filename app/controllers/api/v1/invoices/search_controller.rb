class Api::V1::Invoices::SearchController < ApplicationController
  def show
    if params[:random]
      render json: InvoiceSerializer.new(Invoice.sample)
    else
      render json: InvoiceSerializer.new(Invoice.attr_find(invoice_params, 1))
    end
  end

  def index
    render json: InvoiceSerializer.new(Invoice.sorted.attr_find(invoice_params))
  end

  private

    def invoice_params
      params.permit(:id, :customer_id, :merchant_id, :status, :created_at, :updated_at)
    end
end
