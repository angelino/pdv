json.array!(@financial_accounts) do |financial_account|
  json.extract! financial_account, :id, :name
end