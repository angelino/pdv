class SalesController < ApplicationController
  def show
  end

  def create
    puts ">>> #{params}" # Just for debug/dev

    current_user = User.first # FAKE just for development
    @sale = SaleService.new(current_user).create!(params)

    respond_to do |format|
      if @sale.persisted?
        format.json { render :show, status: :created, location: sale_path(sales_id: @sale.id) }
      else
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end

    # @sale = Sale.create
    # render json: { status: :created }
  end
end
