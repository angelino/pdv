class StorageEntriesController < ApplicationController
  before_action :set_storage_entry, only: [:show, :edit, :update, :destroy]

  # GET /storage_entries
  # GET /storage_entries.json
  def index
    filters = JSON.parse(params[:search]) if(params[:search])
    @count, @storage_entries = filter_helper('all', params[:page], 50, filters)
  end

  # POST /storage_entries
  # POST /storage_entries.json
  def create
    @storage_entry = StorageEntry.new(storage_entry_params)
    @storage_entry.point_of_sale = PointOfSale.find(params[:id])

    respond_to do |format|
      if @storage_entry.save
        format.json { render :show, status: :created }
      else
        format.json { render json: @storage_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /storage_entries/1
  # PATCH/PUT /storage_entries/1.json
  def update
    respond_to do |format|
      if @storage_entry.update(storage_entry_params)
        format.json { render :show, status: :ok, location: @storage_entry }
      else
        format.json { render json: @storage_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /storage_entries/1
  # DELETE /storage_entries/1.json
  def destroy
    @storage_entry.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

  def filter_helper(named_scope_name, page, page_size, filters)
    storage_entry = StorageEntry.send(named_scope_name)
    if filters
      order_by = filters['ordened'] || ['storage_entries.movement_date']

      storage_entry = storage_entry.by_reason(filters['reason']['id']) if filters['reason'].present?
      storage_entry = storage_entry.by_product(filters['product']['id']) if filters['product'].present?

      min_date = filters['minDate'].present? ? filters['minDate'].to_date : 10.years.ago.to_date
      max_date = filters['maxDate'].present? ? filters['maxDate'].to_date : 10.years.from_now.to_date
      storage_entry = storage_entry.by_movement_date(min_date,max_date)
    end

    return storage_entry.count, storage_entry.order(order_by).page(page).per(page_size)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def storage_entry_params
    params.require(:storage_entry)
          .permit(:movement_date, :quantity, :product_id, :storage_entry_type_id)
  end
end
