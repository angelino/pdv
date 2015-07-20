json.array!(@diners) do |diner|
  json.extract! diner, :id, :name
end
