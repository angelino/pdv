json.extract! @product, :id, :name, :description, :price, :barcode, :created_at, :updated_at
json.images @product.images do |image|
  json.(image, :public_id, :secure_url, :secure_thumbnail_url)
end