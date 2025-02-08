class SizesController < ApplicationController
  include ItemLocator
  include SizeLocator

  serializer SizeSerializer

  def index
    render json: serialize(item.sizes, { include: [:item] })
  end

  def show
    render json: serialize(size, { include: [:item] })
  end

end
