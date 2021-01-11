class PurchaseRecordsController < ApplicationController

  def index
    @purchaserecord_address = PurchaserecordAddress.new
    @item = Item.find_by(id: params[:item_id])
  end

  def create
    @item = Item.find_by(id: params[:item_id])
    @purchaserecord_address = PurchaserecordAddress.new(purchaserecord_params)
    if @purchaserecord_address.valid?
      @purchaserecord_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def purchaserecord_params
    params.require(:purchaserecord_address).permit(:hoge, :user, :item, :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :purchase_record_id ).merge(user_id: current_user.id,item_id: params.require(:item_id))
  end

end