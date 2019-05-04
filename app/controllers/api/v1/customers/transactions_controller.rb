class Api::V1::Customers::TransactionsController < ApplicationController
  def index
    render json: TransactionSerializer.new(Transaction.joins(:invoice).where(invoices: {customer_id: params[:customer_id]}))
  end
end
