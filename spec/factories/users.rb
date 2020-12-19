FactoryBot.define do
  factory :user do
    nickname               { 'sato' }
    email                  { 'sato@yahoo.co.jp' }
    password               { 'sato111' }
    password_confirmation  { password }
    last_name              { '佐藤' }
    first_name             { '太郎' }
    last_name_reading      { 'サトウ' }
    first_name_reading     { 'タロウ' }
    birthday               { '1930-01-01' }
  end
end
