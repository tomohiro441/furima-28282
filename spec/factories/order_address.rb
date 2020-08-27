FactoryBot.define do
  factory :order_address do
    association :user
    association :item
    token               {Faker::Crypto.md5}
    postal_code         { '123-4567' }
    prefecture_id       { 3 }
    city                { '神奈川県藤沢市' }
    house_number        { 3 - 3 }
    building_number     { 'ライオンズマンション101' }
    phone_number        { '98011112222' }
  end
end
