class Response < ApplicationRecord
	belongs_to :question

	def good?
		return self.content == self.question.valid_response
		#use self in a model instead of @
	end


end
