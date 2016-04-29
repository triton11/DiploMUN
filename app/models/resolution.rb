class Resolution < ActiveRecord::Base
	has_many :amendments
	has_many :resolution_countries
	has_many :countries, :through => :resolution_countries
end
