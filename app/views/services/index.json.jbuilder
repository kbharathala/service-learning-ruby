json.array!(@services) do |service|
  json.extract! service, :id, :place, :hours
  json.url service_url(service, format: :json)
end
