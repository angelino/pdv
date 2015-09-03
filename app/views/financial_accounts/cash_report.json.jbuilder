json.array!(@account_entries) do |account|
  json.(account, :id, :date, :value)
  json.point_of_sale do
    json.extract! account.point_of_sale, :id, :name
  end
end