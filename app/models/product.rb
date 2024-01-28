class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase

  validates :name , presence: true
  validates :image, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
   
end
