json.array!(@storage_entries) do |storage_entry|
  json.extract! storage_entry, :id, :reason, :quantity, :point_of_sale_id, :product_id
  json.url storage_entry_url(storage_entry, format: :json)
end
