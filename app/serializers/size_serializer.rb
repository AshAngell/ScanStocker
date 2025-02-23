class SizeSerializer
  include JSONAPI::Serializer
  singleton_class.include Rails.application.routes.url_helpers

  belongs_to :item

  attributes :amount

  link :cart_url do |size|
    cart_items_item_size_path(size.item, size)
  end
end
