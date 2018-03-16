class CartRecord < ApplicationRecord
  belongs_to :user
  belongs_to :item_list
  has_many :items, through: :item_lists
end
