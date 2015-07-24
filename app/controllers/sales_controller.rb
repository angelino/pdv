class SalesController < ApplicationController
  def show
  end

  def create
    # ActiveRecord::Base.transaction do
    #   @product = Product.new(product_params)
    #   @product.save!
    #   @product.images << Image.where(id: params['images'].collect{|img| img.select{|k,v| ['id'].include? k}.values}) if params['images'] && params['images'].size > 0
    # end

    # respond_to do |format|
    #   if @product.persisted?
    #     format.json { render :show, status: :created, location: @product }
    #   else
    #     format.json { render json: @product.errors, status: :unprocessable_entity }
    #   end
    # end
    puts params

    format.json { render :show, status: :created, location: Sale.create }
  end
end
