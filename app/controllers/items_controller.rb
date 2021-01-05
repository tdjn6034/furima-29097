class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :create_item, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find_by(id: params[:id])
  end

  def edit
    redirect_to :root if current_user != @item.user
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy if current_user == @item.user

    redirect_to root_path
  end

  private

  def create_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :product_description, :category_id, :quality_id, :delivery_fee_id, :prefecture_id, :days_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end
end
