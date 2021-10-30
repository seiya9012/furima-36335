class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  with_options presence: true do
    validates :name
    validates :discription
    validates :price, numericality: { only_integer: true, with: /\A[0-9]+\z/, greater_than_or_equal_to: 300,
                                      less_than_or_equal_to: 9_999_999 }
    validates :image, presence: true
  end
  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :cost_id
    validates :shipping_day_id
    validates :prefecture_id
    validates :status_id
  end
  has_one_attached :image
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :cost
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_day
end
