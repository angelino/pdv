class StorageEntryTypesController < ApplicationController
  before_action :set_storage_entry_type, only: [:show, :edit, :update, :destroy]

  # GET /storage_entry_types
  # GET /storage_entry_types.json
  def index
    @storage_entry_types = StorageEntryType.all
  end

  # GET /storage_entry_types/1
  # GET /storage_entry_types/1.json
  def show
  end

  # GET /storage_entry_types/new
  def new
    @storage_entry_type = StorageEntryType.new
  end

  # GET /storage_entry_types/1/edit
  def edit
  end

  # POST /storage_entry_types
  # POST /storage_entry_types.json
  def create
    @storage_entry_type = StorageEntryType.new(storage_entry_type_params)

    respond_to do |format|
      if @storage_entry_type.save
        format.json { render :show, status: :created, location: @storage_entry_type }
      else
        format.json { render json: @storage_entry_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /storage_entry_types/1
  # PATCH/PUT /storage_entry_types/1.json
  def update
    respond_to do |format|
      if @storage_entry_type.update(storage_entry_type_params)
        format.json { render :show, status: :ok, location: @storage_entry_type }
      else
        format.json { render json: @storage_entry_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /storage_entry_types/1
  # DELETE /storage_entry_types/1.json
  def destroy
    @storage_entry_type.destroy!
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_storage_entry_type
      @storage_entry_type = StorageEntryType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def storage_entry_type_params
      params.require(:storage_entry_type).permit(:reason, :plus_minus_marker, :sell_marker)
    end
end
