class ItemsController < ApplicationController
  include ItemLocator

  serializer ItemSerializer

  def index
    items = Item.all
    render json: serialize(items, { include: [:sizes] })
  end

  def create

  end

  def update

  end

  def destroy

  end
end
