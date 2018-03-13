class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :orders
  has_many :address_lists, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_many :cart_records
  has_many :item_lists, through: :carts
  has_many :favorite_items, dependent: :destroy
  has_many :favorite_shops, dependent: :destroy
  has_many :favorite_brands, dependent: :destroy

end
