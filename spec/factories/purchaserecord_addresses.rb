FactoryBot.define do
  factory :purchaserecord_address do
    token         { 'token012345678' }
    postal_code   { '111-1111' }
    prefecture_id { 2 }
    municipality  { '札幌市' }
    address       { '中央区1-1-1' }
    building_name { '' }
    phone_number  { '09012345678' }
  end
end
