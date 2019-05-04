class Api::V1::Transactions::SearchController < ApplicationController

  def show
    if params[:random]
      return render json: TransactionSerializer.new(Transaction.sample)
    end
    render json: TransactionSerializer.new(Transaction.where(transaction_params).first)
  end

  def index
    render json: TransactionSerializer.new(Transaction.sorted.where(transaction_params))
  end

  private

    def transaction_params
      params.permit(:id, :invoice_id, :credit_card_number, :credit_card_expiration_date, :result, :created_at, :updated_at)
    end
end
