json.array!(@storage_entries) do |storage_entry|
  json.extract! storage_entry, :id, :movement_date, :reason, :quantity, :point_of_sale_id
  json.product storage_entry.product, :id, :name
end