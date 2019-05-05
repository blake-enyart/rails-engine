class Api::V1::Transactions::InvoicesController < ApplicationController
  def show
    render json: InvoiceSerializer.new(Invoice.transaction_find(params[:transaction_id]))
  end
end
