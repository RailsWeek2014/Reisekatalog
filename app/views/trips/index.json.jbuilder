json.array!(@trips) do |trip|
  json.extract! trip, :id, :land, :region, :hotel, :infos, :preis, :rating
  json.url trip_url(trip, format: :json)
end
