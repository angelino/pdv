json.array!(@items) do |item|
  json.product do
    json.extract! item.product, :id, :name, :description, :price, :barcode
    json.images item.product.images
  end
  json.extract! item, :quantity
end
