class PurchaserecordAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: " Input correctly" }
    validates :municipality
    validates :address
    validates :phone_number, numericality: { only_integer: true, message: "Input only number"}
  end

  def save
    Address.create(user: user_id, item: item_id, postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number)
  end

end