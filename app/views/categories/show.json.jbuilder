json.extract! @category, :id, :name, :description

#Get the polls
json.polls @category.polls do |p|
  json.extract! p, :id, :title, :description
  #Get the options
  # json.options p.options do |o|
  #   json.extract! o, :id, :label, :value
  # end

  #Get the user
  json.user do
    json.extract! p.user, :id, :firstname, :lastname
  end

  json.url poll_url(p, format: :json)
end
