class DinersController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    # FIXME: Use a better abstraction for a diner
    @diners = PointOfSale.all
  end

  def show
    @diner = PointOfSale.find(params[:id])
  end
end
