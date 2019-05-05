class Api::V1::Invoices::ItemsController < ApplicationController
  def index
    render json: ItemSerializer.new(Item.item_to_invoice_find(params[:invoice_id]))
  end
end
