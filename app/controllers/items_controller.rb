class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name, :product_description, :category_id, :quality_id, :delivery_fee_id, :prefecture_id, :days_to_ship_id, :price,:user,:image)
  end
end
