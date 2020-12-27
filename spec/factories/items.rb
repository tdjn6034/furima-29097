FactoryBot.define do
  factory :item do
    name                { '写真' }
    product_description { '夜景の写真です' }
    category_id         { '2' }
    quality_id          { '2' }
    delivery_fee_id     { '2' }
    prefecture_id       { '2' }
    days_to_ship_id     { '2' }
    price               { '500' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
