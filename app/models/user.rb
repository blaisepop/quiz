class User < ApplicationRecord
  attr_accessor :password, :password_confirmation
  acts_as_authentic

  has_many :responses
  has_many :questions

  validates :email, uniqueness: {
    message: 'déjà existant'
  }

  validates :email,
            format: {
              with: /.+@.+\.[a-z]+/,
              message: 'doit être une adresse mail'
            },
            length: { maximum: 100 }
end
