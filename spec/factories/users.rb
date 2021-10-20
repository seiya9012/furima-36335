FactoryBot.define do
  factory :user do
    nick_name                { 'タロウ' }
    email { Faker::Internet.email }
    password                { '000000a' }
    password_confirmation   { password }
    family_name               { '山田' }
    first_name              { '太郎' }
    family_name_kana          { 'ヤマダ' }
    first_name_kana         { 'タロウ' }
    birth_date                { '1999-01-01}' }
  end
end