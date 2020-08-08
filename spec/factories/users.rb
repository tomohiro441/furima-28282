FactoryBot.define do
  factory :user do
    nickname              { 'furima太郎' }
    email                 { 'kkk@gmail.com' }
    password              { '0000aaa' }
    password_confirmation { '0000aaa' }
    last_name             { '太郎' }
    first_name            { '佐藤' }
    last_name_reading     { 'タロウ' }
    first_name_reading    { 'サトウ' }
    birthday              { '1990, 07, 07' }
  end
end
