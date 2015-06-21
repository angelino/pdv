class StorageController < ApplicationController
  before_action :set_storage

  def show
    @items = @storage.items
  end

  private

  def set_storage
    @storage = Storage.new(point_of_sale_id: params[:id])
  end
end
