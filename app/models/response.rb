require 'fuzzystringmatch'

class Response < ApplicationRecord
	belongs_to :question
	belongs_to :user
	validates :content, length: {minimum:2}
	def good?
		return false if self.content.nil?
		return false if self.question.valid_response.nil?
		jarow = FuzzyStringMatch::JaroWinkler.create( :native )
		distance =  jarow.getDistance(  self.content, self.question.valid_response )
		return distance > 0.8
		#use self in a model instead of @
	end


end
