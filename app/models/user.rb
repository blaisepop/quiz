class User < ApplicationRecord
  validates :email, uniqueness: {
    message: "déjà existant" }

  validates :email,
    format: {
      with: /.+@.+\.[a-z]+/,
      message: "doit être une adresse mail"
    },
    length: { maximum: 100 }

end
