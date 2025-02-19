class ItemsController < ApplicationController
  include ItemLocator

  serializer ItemSerializer

  def index
    render json: serialize(Item.all)
  end

  def show
    render json: serialize(item, { include: [:sizes] })
  end

  def create
    new_item = Item.new(item_params)
    attempt_save_then(new_item) do
      render json: serialize(new_item), status: :created
    end
  end

  def update
    item.assign_attributes(item_params)
    attempt_save_then(item) do
      render json: serialize(item, { include: [:sizes] }), status: :ok
    end
  end

  def destroy
    item.destroy
    head :no_content
  end

  private

  def item_params
    params.require(:item).permit(:brand, :name, :barcode, :units, sizes_attributes: [:id, :amount, :_destroy])
  end
end
