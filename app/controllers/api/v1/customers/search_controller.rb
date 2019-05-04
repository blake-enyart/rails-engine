class Api::V1::Customers::SearchController < ApplicationController
  def show
    if params[:random]
      render json: CustomerSerializer.new(Customer.sample)
    else
      render json: CustomerSerializer.new(Customer.where(customer_params).first)
    end
  end

  def index
    render json: CustomerSerializer.new(Customer.where(customer_params))
  end

  private

    def customer_params
      params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
    end
end
