json.array!(@items) do |item|
  json.extract! item.product, :id, :name, :description, :price, :image
end
