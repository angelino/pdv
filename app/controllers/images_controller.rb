class ImagesController < ApplicationController

  # POST /images.json
  def create
    @image = Image.create!(image_params)

    render json: @image.as_json(except: [:created_at])
  end

  # DELETE /images/:id.json
  def destroy
    @image = Image.find(params[:id])
    @image.destroy!

    render json: @image.as_json(except: [:created_at])
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:public_id, :owner_type, :owner_id)
    end
end
