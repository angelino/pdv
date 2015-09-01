json.array!(@storage_entries) do |storage_entry|
  json.extract! storage_entry, :id, :movement_date, :quantity, :point_of_sale_id
  json.product storage_entry.product, :id, :name
  json.storage_entry_type storage_entry.storage_entry_type, :id, :reason
end