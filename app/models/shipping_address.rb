class ShippingAddress 
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :product_id, :user_id

  with_options presence: true do
  validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: "は3桁ハイフン4桁の形式で入力してください" }
  validates :prefecture_id , numericality: { other_than: 0 , message: "can't be blank"}
  validates :city
  validates :house_number
  validates :phone_number, presence: true
  validates :phone_number, length: { in: 10..11, message: "は10桁以上11桁以内で入力してください" }
  validates :phone_number, numericality: { only_integer: true, message: "は半角数値のみ入力してください" }
  end

  def save
    order = Order.create(product_id:product_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name,phone_number:phone_number, order_id: order.id)
  end
end
