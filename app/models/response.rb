require 'fuzzystringmatch'

class Response < ApplicationRecord
	belongs_to :question

	def good?
		require 'fuzzystringmatch'
		jarow = FuzzyStringMatch::JaroWinkler.create( :native )
		distance =  jarow.getDistance(  self.content, self.question.valid_response )
		return distance > 0.8
		#use self in a model instead of @
	end


end
