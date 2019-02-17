require 'test_helper'

class ResponseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end


  test "should be good response" do
    r = responses(:valid_response)
    assert r.good?
  end


  test "should be bad response" do
    r = responses(:bad_response)
    assert_not r.good?
  end

  test "should be almost good response" do
    r = responses(:almost_valid_response)
    assert r.good?
  end

  test "should be bad response with nil" do
    r = responses(:bad_response)
    r.content=nil
    assert_not r.good?
  end

end
