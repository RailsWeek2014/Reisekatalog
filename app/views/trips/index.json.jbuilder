json.array!(@trips) do |trip|
  json.extract! trip, :id, :land, :region, :hotel, :infos, :preis
  json.url trip_url(trip, format: :json)
end
