class Api::V1::Customers::InvoicesController < ApplicationController
  def index
    render json: InvoiceSerializer.new(Invoice.customer_find(params[:customer_id]))
  end
end
