class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :quality

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery_fee

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :days_to_ship

  with_options presence: true do
    validates :image
    validates :name
    validates :product_description
    validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equel_to: 9_999_999, message: 'Out of setting range' }
    validates :category_id, numericality: { other_than: 1, message: 'Select' }
    validates :quality_id, numericality: { other_than: 1, message: 'Select' }
    validates :delivery_fee_id, numericality: { other_than: 1, message: 'Select' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :days_to_ship_id, numericality: { other_than: 1, message: 'Select' }
  end

  has_one :purchase_record
  belongs_to :user
end
