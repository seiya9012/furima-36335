class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :items
  with_options presence: true do
    validates :name
    validates :discription
    validates :price, numericality: { only_integer: true, with: /\A[0-9]+\z/, greater_than_or_equal_to: 300,
                                      less_than_or_equal_to: 9_999_999 }
  end
  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :cost_id
    validates :shipping_day_id
    validates :prefecture_id
    validates :status_id
  end
  has_many_attached :images
  belongs_to :user
end
