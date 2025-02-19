# frozen_string_literal: true

module SizeLocator
  extend ActiveSupport::Concern

  protected

  def size
    @size ||= Size.includes(:item).find(params[:size_id] || params[:id])
  end
end
