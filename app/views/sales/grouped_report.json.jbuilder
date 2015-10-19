json.array!(@sales_groups) do |grouped_sale|
  json.(grouped_sale, :date, :value)
end