json.array!(@countries) do |country|
  json.extract! country, :id, :name, :description, :visit_from, :visit_to, :datetime, :currency
  json.url country_url(country, format: :json)
end
