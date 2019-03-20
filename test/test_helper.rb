ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # This will simulate a login with the given user.
  def login(user, password = 'benrocks')
    post user_sessions_url, params: { user_session: {email: user.email, password: password} }
    # Also, we verify after that connection is valid (have a `user_credentials`)
    assert_equal controller.session["user_credentials"], user.persistence_token
  end

  # Add more helper methods to be used by all tests here...
end
