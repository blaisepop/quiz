require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
   test "Get all existing tags for questions" do
    assert_equal ["2000","girls","pop","usa"], Question.all_existing_tags
  end

  test "Get all existing tags for questions for select option" do
   assert_equal [["2000", "2000"],["girls", "girls"],["pop", "pop"],["usa","usa"]], Question.tags_options
 end

end
