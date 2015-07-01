class ImagesController < ApplicationController

  # POST /products.json
  def create
    @image = Image.create!(image_params)

    render json: @image.as_json
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:public_id, :owner_type, :owner_id)
    end
end
