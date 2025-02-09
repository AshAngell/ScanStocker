class Size < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  belongs_to :item

end
