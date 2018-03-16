class Order < ApplicationRecord
  belongs_to :user
  has_many :ordered_items, dependent: :destroy
  has_many :items, through: :ordered_items
  belongs_to :address_list

  accepts_nested_attributes_for :ordered_items, allow_destroy: true
end
