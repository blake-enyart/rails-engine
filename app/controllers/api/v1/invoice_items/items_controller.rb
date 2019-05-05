class Api::V1::InvoiceItems::ItemsController < ApplicationController
  def show
    render json: ItemSerializer.new(Item.item_to_invoice_item_find(params[:invoice_item_id]))
  end
end
