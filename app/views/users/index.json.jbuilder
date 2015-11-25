json.array!(@users) do |user|
  json.extract! user, :id, :name, :hours
  json.url user_url(user, format: :json)
end
