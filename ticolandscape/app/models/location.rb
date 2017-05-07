class Location < ApplicationRecord
	

	def full_address
		"#{self.country}, #{self.state}, #{self.city}"
	end
end
