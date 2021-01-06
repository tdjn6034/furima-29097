class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :quality
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :days_to_ship

  

  has_one :purchase_record
  belongs_to :user
end
