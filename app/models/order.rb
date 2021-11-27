class Order
  attr_accessor :token
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :name, :post_code, :prefecture_id, :city, :adress, :building_name, :phone_number,:token


  with_options presence: true do
    
    validates :user_id
    validates :item_id
    validates :post_code,        format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id,   numericality: { other_than: 1 }
    validates :city
    validates :adress
    validates :phone_number, numericality: { only_integer: true },format: { with: /\A\d{10,11}\z/}
    validates :token
  end
 
  def save
    management = Management.create(user_id: user_id, item_id: item_id)
    Adress.create(post_code: post_code, prefecture_id: prefecture_id, city: city, adress: adress, building_name: building_name, phone_number: phone_number,management_id: management.id)
  end
end

