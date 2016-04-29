# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Country.create(name: 'USA', email: 'tut@seas.upenn.edu', password_hash: 'tristrum', 
	resource: 3000, r_energy: 150, n_energy: 150, f_military: 2000, 
	u_military: 0, tech: 0, education: 0, infrastructure: 0, 
	funds: 0, economy: 0.5, quality: 0.5, happiness: 0.5, climate: 0.5, population: 300,
	e_metric: 5.0, r_metric: 5.0, f_metric: 5.0, c_metric: 5.0)
Country.create(name: 'Russia', email: 'tut@seas.upenn.edu', password_hash: 'russia', 
	resource: 1500, r_energy: 100, n_energy: 50, f_military: 1000, 
	u_military: 0, tech: 500, education: 500, infrastructure: 500, 
	funds: 0, economy: 0.5, quality: 0.5, happiness: 0.5, climate: 0.5, population: 143,
	e_metric: 5.0, r_metric: 5.0, f_metric: 5.0, c_metric: 5.0)
Country.create(name: 'UK', email: 'tut@seas.upenn.edu', password_hash: 'uk', 
	resource: 640, r_energy: 32, n_energy: 32, f_military: 500, 
	u_military: 0, tech: 0, education: 0, infrastructure: 0,
	funds: 640, economy: 0.5, quality: 0.5, happiness: 0.5, climate: 0.5, population: 64,
	e_metric: 5.0, r_metric: 5.0, f_metric: 5.0, c_metric: 5.0)
Country.create(name: 'China', email: 'tut@seas.upenn.edu', password_hash: 'china', 
	resource: 13000, r_energy: 300, n_energy: 1000, f_military: 1000, 
	u_military: 0, tech: 0, education: 0, infrastructure: 0,
	funds: 14000, economy: 0.5, quality: 0.5, happiness: 0.5, climate: 0.5, population: 1357,
	e_metric: 5.0, r_metric: 5.0, f_metric: 5.0, c_metric: 5.0)
Country.create(name: 'France', email: 'tut@seas.upenn.edu', password_hash: 'france', 
	resource: 660, r_energy: 33, n_energy: 33, f_military: 500, 
	u_military: 0, tech: 0, education: 0, infrastructure: 0,
	funds: 660, economy: 0.5, quality: 0.5, happiness: 0.5, climate: 0.5, population: 66,
	e_metric: 5.0, r_metric: 5.0, f_metric: 5.0, c_metric: 5.0)
Country.create(name: 'Admin', email: 'tut@seas.upenn.edu', password_hash: 'admin', 
	resource: 0, r_energy: 0, n_energy: 0, f_military: 0, 
	u_military: 0, tech: 0, education: 0, infrastructure: 0,
	funds: 0, economy: 0, quality: 0, happiness: 0, climate: 0, population: 0,
	e_metric: 0, r_metric: 0, f_metric: 0, c_metric: 0)
Inter.create(global: 0, iclimate: 0, iquality: 0, time: 0)