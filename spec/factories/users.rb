FactoryBot.define do
  factory :users do
    nickname              { 'furima太郎' }
    email                 { 'kkk@gmail.com' }
    password              { '0000aaa' }
    password_confirmation { '0000aaa' }
    last_name             { '太郎' }
    first_name            { '佐藤' }
    last_name_reading     { 'タロウ' }
    first_name_reading    { 'サトウ' }
    birthday              { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
