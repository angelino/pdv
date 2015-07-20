json.extract! @storage_entry, :id, :reason, :movement_date, :quantity, :point_of_sale_id, :created_at, :updated_at
json.product @storage_entry.product, :id, :name

