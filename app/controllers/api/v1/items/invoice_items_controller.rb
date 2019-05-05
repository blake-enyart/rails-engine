class Api::V1::Items::InvoiceItemsController < ApplicationController
  def index
    render json: InvoiceItemSerializer.new(InvoiceItem.item_find(params[:item_id]))
  end
end
