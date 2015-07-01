json.array!(@products) do |product|
  json.extract! product, :id, :name, :description, :price, :barcode
  json.images product.images do |image|
    json.(image, :public_id, :secure_url, :secure_thumbnail_url)
  end
  json.url product_url(product, format: :json)
end