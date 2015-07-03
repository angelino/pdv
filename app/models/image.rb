class Image < ActiveRecord::Base
  belongs_to :owner, polymorphic: true
  before_destroy :destroy_at_cloudinary

  def destroy_at_cloudinary
    Cloudinary::Uploader.destroy(self.public_id) if self.public_id
  end

  def url
    "http://#{default_cloudinary_url}#{self.public_id}"
  end

  def secure_url
    "https://#{default_cloudinary_url}#{self.public_id}"
  end

  def thumbnail_url
    "http://#{default_cloudinary_url}t_media_lib_thumb/#{self.public_id}"
  end

  def secure_thumbnail_url
    "https://#{default_cloudinary_url}t_media_lib_thumb/#{self.public_id}"
  end

  private
    def default_cloudinary_url
      "res.cloudinary.com/msitbrasil/image/upload/"
    end

end
