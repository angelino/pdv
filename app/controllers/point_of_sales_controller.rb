class PointOfSalesController < ApplicationController
  before_action :set_point_of_sale, only: [:show, :edit, :update, :destroy]

  # GET /point_of_sales
  # GET /point_of_sales.json
  def index
    @point_of_sales = PointOfSale.all
  end

  # GET /point_of_sales/1
  # GET /point_of_sales/1.json
  def show
  end

  # GET /point_of_sales/new
  def new
    @point_of_sale = PointOfSale.new
  end

  # GET /point_of_sales/1/edit
  def edit
  end

  # POST /point_of_sales
  # POST /point_of_sales.json
  def create
    @point_of_sale = PointOfSale.new(point_of_sale_params)

    respond_to do |format|
      if @point_of_sale.save
        format.json { render :show, status: :created, location: @point_of_sale }
      else
        format.json { render json: @point_of_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /point_of_sales/1
  # PATCH/PUT /point_of_sales/1.json
  def update
    respond_to do |format|
      if @point_of_sale.update(point_of_sale_params)
        format.json { render :show, status: :ok, location: @point_of_sale }
      else
        format.json { render json: @point_of_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /point_of_sales/1
  # DELETE /point_of_sales/1.json
  def destroy
    @point_of_sale.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_point_of_sale
      @point_of_sale = PointOfSale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def point_of_sale_params
      params.require(:point_of_sale).permit(:name)
    end
end
