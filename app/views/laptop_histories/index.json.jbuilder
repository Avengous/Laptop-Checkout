json.array!(@laptop_histories) do |laptop_history|
  json.extract! laptop_history, :laptop_id, :transaction_id
  json.url laptop_history_url(laptop_history, format: :json)
end
