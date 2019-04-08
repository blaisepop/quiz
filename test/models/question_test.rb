require 'test_helper'

class QuestionTest < ActiveSupport::TestCase

  test "get all_existing_tags options" do
    assert_equal ['electro', 'music'], Question.all_existing_tags
  end

  test "get tags options" do
    assert_equal [['electro', 'electro'], ['music', 'music']], Question.tags_options
  end

end
