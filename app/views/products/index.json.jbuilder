json.array!(@products) do |product|
  json.extract! product, :id, :name, :description, :price, :image, :public_id, :barcode
  json.url product_url(product, format: :json)
end
