json.array!(@users) do |user|
  json.extract! user, :id, :firstname, :lastname, :description
  json.url user_url(user, format: :json)
end
