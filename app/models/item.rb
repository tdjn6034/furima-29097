class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :quality
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :days_to_ship

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

  has_one :purchase_record
  belongs_to :user
end
