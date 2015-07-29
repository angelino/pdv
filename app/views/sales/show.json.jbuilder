json.extract! @sale, :id, :created_at, :updated_at

# json.array!(@items) do |item|
#   json.product do
#     json.extract! item.product, :id, :name, :description, :price, :barcode
#     # json.url product_url(item.product, format: :json)
#   end
#   json.extract! item, :quantity
# end
