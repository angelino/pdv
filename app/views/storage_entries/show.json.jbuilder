json.extract! @storage_entry, :id, :movement_date, :quantity, :point_of_sale_id, :created_at, :updated_at
json.product @storage_entry.product, :id, :name
json.storage_entry_type @storage_entry.storage_entry_type, :id, :reason

