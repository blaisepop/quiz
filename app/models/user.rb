class User < ApplicationRecord
  acts_as_authentic do |c|
    c.crypto_provider = Authlogic::CryptoProviders::Sha512
  end

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
