class User < ApplicationRecord
    acts_as_authentic
    has_many :responses
    has_many :questions
  validates :email, uniqueness: {
    message: "déjà existant" }

  validates :email,
    format: {
      with: /.+@.+\.[a-z]+/,
      message: "doit être une adresse mail"
    },
    length: { maximum: 100 }


    # Filter all questions who user have no response on it
    def unanswered_questions
      # todo: finish logic here
      Question.all
    end



end
