class Inter < ActiveRecord::Base
	def change
		self.time += 1
  end
end
