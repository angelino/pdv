json.array!(@items) do |item|
  json.extract! item.product, :id, :name, :description, :price
  json.images item.product.images do |image|
    json.(image, :thumbnail_url, :url)
  end
end
