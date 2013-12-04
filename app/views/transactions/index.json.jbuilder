json.array!(@transactions) do |transaction|
  json.extract! transaction, :laptops_id, :users_id, :checked_out, :checked_out_time, :checked_in, :checked_in_time
  json.url transaction_url(transaction, format: :json)
end
