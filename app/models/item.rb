class Item < ApplicationRecord
  def change
    create_table :items do |t|
  end
end
