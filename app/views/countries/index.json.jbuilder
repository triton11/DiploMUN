json.array!(@countries) do |country|
  json.extract! country, :id, :name, :email, :password, :resource, :r_energy, :n_energy, :f_military, :u_military, :tech, :education, :infrastructure
  json.url country_url(country, format: :json)
end
