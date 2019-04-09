class Question < ApplicationRecord
	has_many :responses
	validates_presence_of :valid_response
	validates :valid_response, length: {minimum:2}

	
	# we create a method that can be called anywhere
	# Loop over each questions in databases and get all existings tags
	# @return [Array] someting like `['electro', 'music']`
	def self.all_existing_tags
		return []
	end

	def save
	end
end
