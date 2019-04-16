class User < ApplicationRecord
  acts_as_authentic
  has_many :responses
  has_many :questions

  enum role: %i[user admin super_admin]

  validates :email, uniqueness: { message: 'déjà existant' }
  validates :email,
            format: {
              with: /.+@.+\.[a-z]+/,
              message: 'doit être une adresse mail'
            },
            length: { maximum: 100 }

  # Filter all questions who user have no response on it
  def unanswered_questions
    Question.all.reject do |question|
      responsers_id = question.responses.pluck(:user_id)
      responsers_id.include?(id)
    end
  end
end
