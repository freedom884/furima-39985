class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  
  belongs_to :user
  has_one_attached :image
  has_one :purchase

  validates :name , presence: true
  validates :image, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :genre_id, numericality: { other_than: 1 , message: "can't be blank"}
   
end
