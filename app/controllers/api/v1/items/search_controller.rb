class Api::V1::Items::SearchController < ApplicationController
  def show
    if params[:random]
      render json: ItemSerializer.new(Item.sample)
    elsif params[:unit_price]
      render json: ItemSerializer.new(Item.unit_price_find(unit_price_params, 1))
    else
      render json: ItemSerializer.new(Item.attr_find(item_params, 1))
    end
  end

  def index
    if params[:unit_price]
      render json: ItemSerializer.new(Item.unit_price_find(unit_price_params))
    else
      render json: ItemSerializer.new(Item.sorted.attr_find(item_params))
    end
  end

  private

    def item_params
      params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
    end

    def unit_price_params
      ((item_params[:unit_price].to_f) * 100).round.to_s.split('.')[0]
    end
end
