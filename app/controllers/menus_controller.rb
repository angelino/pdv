class MenusController < ApplicationController
  skip_before_action :authenticate_user!

  before_action :set_storage

  def show
    # FIXME: Use a better abstraction for menu
    @items = @storage.items
  end

  private

  def set_storage
    @storage = Storage.new(point_of_sale_id: params[:id])
  end
end
