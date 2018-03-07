class SubImage < ApplicationRecord
  has_one :item_sub_image
  belongs_to :color
end
