json.array!(@sales) do |sale|
  json.(sale, :id, :created_at, :value)

  json.entries do
    json.array!(sale.sale_entries) do |sale_entry|
      json.(sale_entry, :id, :price_at_date, :quantity)
      json.product do
        json.extract! sale_entry.product, :id, :name
      end
    end
  end

end
