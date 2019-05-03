class Api::V1::Invoices::ItemsController < ApplicationController
  def index
    render json: ItemSerializer.new(Item.joins(invoice_items: :invoice).where(invoice_items: {invoice_id: params[:invoice_id]}))
  end
end
