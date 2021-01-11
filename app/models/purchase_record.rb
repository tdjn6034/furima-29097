class PurchaseRecord < ApplicationRecord

  has_one_attached :image

  belongs_to :item
  has_one :address
  belongs_to :user
  
end
