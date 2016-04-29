json.array!(@resolutions) do |resolution|
  json.extract! resolution, :id, :name, :topic, :body
  json.url resolution_url(resolution, format: :json)
end
