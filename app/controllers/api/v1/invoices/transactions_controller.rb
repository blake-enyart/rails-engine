class Api::V1::Invoices::TransactionsController < ApplicationController
  def index
    render json: TransactionSerializer.new(Transaction.where(invoice_id: params[:invoice_id]))
  end
end
