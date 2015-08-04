class SalesController < ApplicationController
  def show
  end

  def create
    puts ">>> #{params}" # Just for debug/dev

    @sale = SaleService.new(current_user).create!(params)

    respond_to do |format|
      if @sale.persisted?
        format.json { render json: @sale.as_json, status: :created }
      else
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end

    # @sale = Sale.create
    # render json: { status: :created }
  end
end
