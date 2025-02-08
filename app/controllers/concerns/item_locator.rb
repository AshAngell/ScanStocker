# frozen_string_literal: true

module ItemLocator
  extend ActiveSupport::Concern

  protected

  def item
    @item ||= Item.includes(:sizes).find(params[:item_id] || params[:id])
  end
end
