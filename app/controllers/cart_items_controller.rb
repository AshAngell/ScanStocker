class CartItemsController < ApplicationController
  include SizeLocator
  # serializer

  def create
    cart_item = CartItem.find_or_create_by(ref_id: params[:ref_id], size: size)
    cart_item.increment!(:quantity)
    head :ok
  end
end
