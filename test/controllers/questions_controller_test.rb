require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @question = questions(:one)
  end

  test "should get index" do
    get questions_url
    assert_response :success
  end

  test "should get new" do
    login(users(:one))
    get new_question_url
    assert_response :success
  end

  test "should forbid get new" do
    get new_question_url
    assert_response :redirect
  end

  test "should create question" do
    login(users(:one))
    assert_difference('Question.count') do
      post questions_url, params: { question: { title: @question.title, valid_response:"text" } }
    end

    assert_redirected_to question_url(Question.last)
  end

  test "should forbid create question" do
    assert_no_difference('Question.count') do
      post questions_url, params: { question: { title: @question.title, valid_response:"text" } }
    end
  end

  test "should not create question" do
    assert_no_difference('Question.count') do
      post questions_url, params: { question: { title: @question.title } }
    end
  end

  test "should show question" do
    get question_url(@question)
    assert_response :success
  end

  test "should get edit" do
    login @question.user
    get edit_question_url(@question)
    assert_response :success
  end

  test "should forbid get edit for other user" do
    login(users(:two))
    get edit_question_url(@question)
    assert_response :redirect
  end

  test "should forbid get edit for unlogged user" do
    get edit_question_url(@question)
    assert_response :redirect
  end

  test "should update question" do
    login @question.user
    patch question_url(@question), params: { question: { title: @question.title, valid_response:"text" } }
    assert_redirected_to question_url(@question)
  end

  test "should destroy question" do
    login @question.user
    assert_difference('Question.count', -1) do
      delete question_url(@question)
    end

    assert_redirected_to questions_url
  end

  test "should not destroy question for other user" do
    login(users(:two))
    assert_no_difference('Question.count') do
      delete question_url(@question)
    end

  end
end
