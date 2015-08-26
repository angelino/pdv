json.array!(@items) do |item|
  json.product do
    json.extract! item.product, :id, :name, :description, :price, :barcode
    json.images do
      json.array!(item.product.images) do |image|
        json.secure_url image.secure_url
      end
    end
  end
  json.extract! item, :quantity
end
