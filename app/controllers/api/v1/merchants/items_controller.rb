class Api::V1::Merchants::ItemsController < ApplicationController
  def index
    render json: ItemSerializer.new(Item.merchant_find(params[:merchant_id]))
  end
end
