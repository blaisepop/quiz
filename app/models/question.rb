class Question < ApplicationRecord
	has_many :responses
	validates_presence_of :valid_response
	validates :valid_response, length: {minimum:2}
end
