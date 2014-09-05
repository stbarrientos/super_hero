class Superhero < ActiveRecord::Base

	def has_cape
		self.cape ? "Yes" : "No"
	end

end