class QrController < ActionController::Base
  def show
    @sizes = Size.all
  end
end
