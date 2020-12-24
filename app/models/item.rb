class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :quality

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery_fee

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :days_to_ship

  validates :image, presence: true
  validates :name, presence: true
  validates :product_description, presence: true
  validates :category_id, presence: true
  validates :quality_id, presence:true
  validates :delivery_fee_id, presence: true
  validates :prefecture_id, presence: true
  validates :days_to_ship_id, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equel_to:9999999}


  validates :category_id, numericality: { other_than: 1 }
  validates :quality_id, numericality: { other_than: 1 }
  validates :delivery_fee_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :days_to_ship_id, numericality: { other_than: 1 }

  has_one :purchase_record
  belongs_to :user
end
