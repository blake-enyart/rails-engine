class Api::V1::Transactions::SearchController < ApplicationController
  def show
    if params[:random]
      render json: TransactionSerializer.new(Transaction.sample)
    else
      render json: TransactionSerializer.new(Transaction.attr_find(transaction_params, 1))
    end
  end

  def index
    render json: TransactionSerializer.new(Transaction.attr_find(transaction_params))
  end

  private

    def transaction_params
      params.permit(:id, :invoice_id, :credit_card_number, :credit_card_expiration_date, :result, :created_at, :updated_at)
    end
end
