class ItemSerializer
  include JSONAPI::Serializer

  has_many :sizes

  attributes :brand, :name, :barcode, :units
end
