json.array!(@diners) do |diner|
  json.extract! diner, :id, :name
  # json.url point_of_sale_url(point_of_sale, format: :json)
end
