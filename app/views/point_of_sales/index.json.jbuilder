json.array!(@point_of_sales) do |point_of_sale|
  json.extract! point_of_sale, :id, :name
  json.url point_of_sale_url(point_of_sale, format: :json)
end
