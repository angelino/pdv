class StorageEntriesController < ApplicationController
  before_action :set_storage_entry, only: [:show, :edit, :update, :destroy]

  # GET /storage_entries
  # GET /storage_entries.json
  def index
    @storage_entries = StorageEntry.all
  end

  # GET /storage_entries/1
  # GET /storage_entries/1.json
  def show
  end

  # GET /storage_entries/new
  def new
    @storage_entry = StorageEntry.new
  end

  # GET /storage_entries/1/edit
  def edit
  end

  # POST /storage_entries
  # POST /storage_entries.json
  def create
    @storage_entry = StorageEntry.new(storage_entry_params)

    respond_to do |format|
      if @storage_entry.save
        format.json { render :show, status: :created, location: @storage_entry }
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
    # Use callbacks to share common setup or constraints between actions.
    def set_storage_entry
      @storage_entry = StorageEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def storage_entry_params
      params.require(:storage_entry).permit(:reason, :quantity, :point_of_sale_id, :product_id)
    end
end
