require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
   test "Get all existing tags for questions" do
    assert_equal ["2000","girls","pop","usa"], Question.all_existing_tags
  end
end
