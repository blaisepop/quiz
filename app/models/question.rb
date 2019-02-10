class Question < ApplicationRecord
	has_many :responses
	validates_presence_of :valid_response
end
