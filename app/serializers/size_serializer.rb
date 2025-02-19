class SizeSerializer
  include JSONAPI::Serializer

  belongs_to :item

  attributes :amount
end
