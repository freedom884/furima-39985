class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shippingfee
  belongs_to :prefecture
  belongs_to :scheduleddelivery



  belongs_to :user
  has_one_attached :image
  has_one :purchase

  validates :name , presence: true
  validates :image, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shippingfee_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :scheduleddelivery_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true, format: { with: /\A[0-9]+\z/, message: "Half-width number" }, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  
  with_options presence: true, numericality: { other_than: 1, message: 'Select'} do
    validates :category_id
    validates :condition_id
    validates :shippingfee_id
    validates :scheduleddelivery_id
    validates :prefecture_id
  end

end
