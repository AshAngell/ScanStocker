class Size < ApplicationRecord
  has_many :cart_items
  belongs_to :item

end
