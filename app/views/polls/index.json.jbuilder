json.array!(@polls) do |poll|
  json.extract! poll, :id
  json.url poll_url(poll, format: :json)
end
