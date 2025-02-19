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

  def create
    size = item.sizes.build(size_params)
    attempt_save_then(size) do
      render json: serialize(size, { include: [:item] }), status: :created
    end
  end

  def update
    size.assign_attributes(size_params)
    attempt_save_then(size) do
      render json: serialize(size, { include: [:item] }), status: :ok
    end
  end

  def destroy
    size.destroy
    head :no_content
  end

  private

  def size_params
    params.require(:size).permit(:amount)
  end
end
