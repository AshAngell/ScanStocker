class CartItemsController < ApplicationController
  include SizeLocator
  # serializer

  def create
    params.permit!
    cart_item = CartItem.find_or_create_by(ref_id: params[:ref_id], size_id: size.id)
    cart_item.increment!(:quantity)
    head :ok
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:ref_id)
  end
end
