class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A.+@.+\..+\z/ }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: "は半角英数字混合で入力してください" }, if: -> { password.present? }
  validates :password_confirmation, presence: true, if: -> { password.present? }
  validates :password, confirmation: true

 
end
