FactoryBot.define do
  factory :order do
    post_code                  { '000-0001' }
    prefecture_id             { 2 }
    city                      { '札幌市' }
    adress                      { 1 }
    building_name                  { 1 }
    phone_number                     { '09012345678' }
    token                     { 'tok_abcdefghijk00000000000000000' }
  end
end