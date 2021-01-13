class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!

  def index
    @purchaserecord_address = PurchaserecordAddress.new
    @item = Item.find_by(id: params[:item_id])
    redirect_to :root if current_user == @item.user || @item.purchase_record.present?
  end

  def create
    @item = Item.find_by(id: params[:item_id])
    @purchaserecord_address = PurchaserecordAddress.new(purchaserecord_params)
    if @purchaserecord_address.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount:@item.price,
        card:purchaserecord_params[:token],
        currency: 'jpy'
      )
      @purchaserecord_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def purchaserecord_params
    params.require(:purchaserecord_address).permit(:hoge, :user, :item, :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :purchase_record_id ).merge(user_id: current_user.id,item_id: params.require(:item_id), token: params[:token])
  end

end