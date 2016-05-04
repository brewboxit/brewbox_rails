json.array!(@categories) do |category|

  json.extract! category, :id, :name, :description
  json.polls_count category.polls.count
  json.url category_url(category, format: :json)

end
