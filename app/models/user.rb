class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :orders
  has_many :carts, dependent: :destroy
  has_many :items, through: :carts
  has_many :favoriteitem
  has_many :items,through: :favoriteitems
  has_many :address_lists
end
