class Item < ApplicationRecord
  has_many :sizes
  has_many :cart_items

end
