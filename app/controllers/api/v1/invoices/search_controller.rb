class Api::V1::Invoices::SearchController < ApplicationController

  def show
    if params[:random]
      return render json: InvoiceSerializer.new(Invoice.sample)
    end
    render json: InvoiceSerializer.new(Invoice.where(invoice_params).first)
  end

  def index
    render json: InvoiceSerializer.new(Invoice.where(invoice_params))
  end

  private

    def invoice_params
      params.permit(:id, :customer_id, :merchant_id, :status, :created_at, :updated_at)
    end
end
