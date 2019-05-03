class Api::V1::Invoices::CustomersController < ApplicationController
  def show
    render json: CustomerSerializer.new(Customer.joins(:invoices).where(invoices: {id: params[:invoice_id]}).first)
  end
end
