require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "Should get unanswered question for user" do
    user = users(:three)
    questions = user.unanswered_questions
    assert_equal [questions(:two)], questions
  end
end
