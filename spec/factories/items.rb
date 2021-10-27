FactoryBot.define do
  factory :item do
    name { '商品名' }
    discription { '説明文' }
    price                     { 300 }
    category_id               { 2 }
    status_id                  { 2 }
    cost_id                    { 2 }
    prefecture_id { 2 }
    shipping_day_id { 2 }
    association :user

    after(:build) do |item|
      item.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
