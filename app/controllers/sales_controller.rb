class SalesController < ApplicationController
  def show
  end

  def create
    logger.debug ">>> #{params}"

    @sale = SaleService.new(current_user).create!(params)

    respond_to do |format|
      if @sale.persisted?
        format.json { render json: @sale.as_json, status: :created }
      else
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  def report
    start_date = params[:start_date].to_date
    end_date = params[:end_date].to_date
    point_of_sale_id = params[:id].to_i

    @sales = SaleService.new(current_user).report(start_date, end_date, point_of_sale_id)
  end

  def grouped_report
    start_date = params[:start_date].to_date
    end_date = params[:end_date].to_date
    point_of_sale_id = params[:id].to_i

    @sales_groups = SaleService.new(current_user).grouped_report(start_date, end_date, point_of_sale_id)
  end

end
