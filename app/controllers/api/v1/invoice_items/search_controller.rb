class Api::V1::InvoiceItems::SearchController < ApplicationController
  def show
    if params[:random]
      render json: InvoiceItemSerializer.new(InvoiceItem.sample)
    elsif params[:unit_price]
      render json: InvoiceItemSerializer.new(InvoiceItem.where(unit_price: unit_price_params).first)
    else
      render json: InvoiceItemSerializer.new(InvoiceItem.where(invoice_item_params).first)
    end
  end

  def index
    if params[:unit_price]
      render json: InvoiceItemSerializer.new(InvoiceItem.where(unit_price: unit_price_params))
    else
      render json: InvoiceItemSerializer.new(InvoiceItem.sorted.where(invoice_item_params))
    end
  end

  private

    def invoice_item_params
      params.permit(:id, :item_id, :invoice_id, :quantity, :invoice_item_id, :unit_price, :created_at, :updated_at)
    end

    def unit_price_params
      ((invoice_item_params[:unit_price].to_f) * 100).round.to_s.split('.')[0]
    end
end
