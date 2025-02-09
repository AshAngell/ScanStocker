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

    if size.save
      render json: serialize(size, { include: [:item] }), status: :created
    else
      render json: { errors: size.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if size.update(size_params)
      render json: serialize(size, { include: [:item] }), status: :ok
    else
      render json: { errors: size.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    size.destroy
    head :no_content
  end

  private

  def size_params
    params.require(:size).permit(:name, :value, :unit)
  end
end
