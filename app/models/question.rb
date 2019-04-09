class Question < ApplicationRecord
	has_many :responses
	validates_presence_of :valid_response
	validates :valid_response, length: {minimum:2}


	# we create a method that can be called anywhere
	# Loop over each questions in databases and get all existings tags
	# @return [Array] someting like `['electro', 'music']`
	def self.all_existing_tags
		Question.all
						.pluck(:tags)
						.compact
						.map { |tags| tags.split(',') }
						.flatten
						.uniq
						.sort
	end

	# @return [Array] someting like `[['electro', 'electro'], ['music', 'music']]`
	def self.tags_options
		Question.all_existing_tags
						.map{ |tags| [tags, tags] }
	end
end
