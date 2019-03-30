require 'test_helper'

class ResponsesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @resp = responses(:one)

  end

  test "should get index" do
    get responses_url
    assert_response :success
  end

  test "should get new" do
    login(users(:one))
    get new_response_url
    assert_response :success
  end

  test "should forbid get new" do
    get new_response_url
    assert_response :redirect
  end

  test "should create wrong response" do
    login(users(:one))
    assert_difference('Response.count') do
      post responses_url, params: { response: { content: "trger", question_id: @resp.question_id } }
    end

    assert_redirected_to question_url(Response.last.question)
  end

  test "should create right response" do
    user = users(:three)
    login(user)
    assert_difference('Response.count') do
      post responses_url, params: { response: { content: @resp.question.valid_response, question_id: @resp.question_id } }
    end

    assert_redirected_to question_url(user.unanswered_questions.last)
  end

  test "should forbid create response" do
    assert_no_difference('Response.count') do
      post responses_url, params: { response: { content: @resp.content, question_id: @resp.question_id } }
    end

    assert_redirected_to(new_user_session_url)
  end

  test "should show response" do
    get response_url(@resp)
    assert_response :success
  end

  test "should get edit" do
    login(users(:one))
    get edit_response_url(@resp)
    assert_response :success
  end

  test "should update response" do
    login(users(:one))
    patch response_url(@resp), params: { response: { content: @resp.content, question_id: @resp.question_id } }
    assert_redirected_to response_url(@resp)
  end

  test "should not update response" do
    login(users(:two))
    patch response_url(@resp), params: { response: { content: @resp.content, question_id: @resp.question_id } }
    assert_redirected_to (new_user_session_url)
  end

  test "should destroy response" do
    login(users(:one))
    assert_difference('Response.count', -1) do
      delete response_url(@resp)
    end

    assert_redirected_to responses_url
  end

  test "should not destroy response" do
    login(users(:two))
    assert_no_difference('Response.count') do
      delete response_url(@resp)
    end

    assert_redirected_to (new_user_session_url)
  end
end
