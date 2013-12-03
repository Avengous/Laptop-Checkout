json.array!(@laptops) do |laptop|
  json.extract! laptop, :scan_code, :item_name
  json.url laptop_url(laptop, format: :json)
end
