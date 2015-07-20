json.array!(@items) do |item|
  json.product item.product, :id, :name, :description, :price
  json.quantity item.quantity
  json.images item.product.images do |image|
    json.(image, :thumbnail_url, :url)
  end
end
