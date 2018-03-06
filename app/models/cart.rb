class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :item
  belongs_to :color
  belongs_to :size
end
