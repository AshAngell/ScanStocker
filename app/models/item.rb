class Item < ApplicationRecord
  has_many :sizes, dependent: :destroy
  has_many :cart_items, through: :sizes

  accepts_nested_attributes_for :sizes, allow_destroy: true

end
