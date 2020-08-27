FactoryBot.define do
  factory :item do
    association :user
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test_image.png')) }
    name                   { 'test_name' }
    info                   { 'test_info' }
    price                  { 500 }
    category_id            { 3 }
    condition_id           { 3 }
    delivery_fee_id        { 3 }
    prefecture_id          { 3 }
    delivery_date_id       { 3 }
  end
end
