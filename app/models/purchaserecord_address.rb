class PurchaseRecordAddress
  include ActiveModel::Model
  attr_accessor :user, :item, :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :purchase_record

  validates :nickname, presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX, message: 'Include both letters and numbers' }

  with_options presence: true do
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'Full-width characters' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'Full-width characters' }
    validates :last_name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters' }
    validates :first_name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters' }
  end

  validates :birthday, presence: true

  with_options presence: true do
    validates :image
    validates :name
    validates :product_description
    validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
    with_options numericality: { other_than: 1, message: 'Select' } do
      validates :category_id
      validates :quality_id
      validates :delivery_fee_id
      validates :prefecture_id
      validates :days_to_ship_id
    end
  end

  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
  validates :municipality, presence: true
  validates :address, presence: true

  with_options presence: true do
    validates :phone_number, numericality: { only_integer: true, message: 'Phone number Input only number'} 
  end

  def save
    user = User.create(nickname: nickname, email: email, encrypted_password: encrypted_password, last_name: last_name, first_name: first_name, last_name_reading: last_name_reading, first_name_reading: first_name_reading,birthday: birthday	)
    Item.create(name: name, product_description: product_description, category_id: category_id, quality_id: quality_id, delivery_fee_id: delivery_fee_id, prefecture_id: prefecture_id, days_to_ship_id: days_to_ship_id, price: price, user: user.id )
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_record: purchase_record)
  end
end