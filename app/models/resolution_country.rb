class ResolutionCountry < ActiveRecord::Base
	belongs_to :country
	belongs_to :resolution
end
