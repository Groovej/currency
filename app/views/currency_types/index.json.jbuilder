json.array!(@currency_types) do |currency_type|
  json.extract! currency_type, :id, :country_id, :name, :value
  json.url currency_type_url(currency_type, format: :json)
end
