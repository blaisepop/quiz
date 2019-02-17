class User < ApplicationRecord
  validates :email, uniqueness: {
    message: "déjà existant" }
end
