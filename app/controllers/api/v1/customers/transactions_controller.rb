class Api::V1::Customers::TransactionsController < ApplicationController
  def index
    render json: TransactionSerializer.new(Transaction.transaction_to_customer_find(params[:customer_id]))
  end
end
