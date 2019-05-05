class Api::V1::Invoices::CustomersController < ApplicationController
  def show
    render json: CustomerSerializer.new(Customer.item_to_customer_find(params[:invoice_id]))
  end
end
