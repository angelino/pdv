json.array!(@storage_entry_types) do |storage_entry|
  json.extract! storage_entry, :id, :reason, :plus_minus_marker, :sell_marker
end