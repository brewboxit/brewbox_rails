json.array!(@polls) do |poll|
  json.extract! poll, :id, :title, :description, :created_at, :updated_at
  json.url poll_url(poll, format: :json)

  json.options poll.options do |o|
    json.id         o.id
    json.label      o.label
    json.value      o.value
    json.ord        o.ord
  end

  json.user do
    json.id         poll.user.id
    json.firstname  poll.user.firstname
    json.lastname   poll.user.lastname
  end

  json.category do
    json.id           poll.category.id
    json.name         poll.category.name
    json.description  poll.category.description
    json.count        poll.category.count
    json.url          category_url(poll.category, format: :json)
  end
end
