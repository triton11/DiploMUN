json.array!(@amendments) do |amendment|
  json.extract! amendment, :id, :body, :sponsor, :resolution_id
  json.url amendment_url(amendment, format: :json)
end
