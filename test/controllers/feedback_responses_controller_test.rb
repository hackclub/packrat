require 'test_helper'

class FeedbackResponsesControllerTest < ActionController::TestCase
  setup do
    @feedback_response = feedback_responses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:feedback_responses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create feedback_response" do
    assert_difference('FeedbackResponse.count') do
      post :create, feedback_response: { meeting_id: @feedback_response.meeting_id, rating: @feedback_response.rating }
    end

    assert_redirected_to feedback_response_path(assigns(:feedback_response))
  end

  test "should show feedback_response" do
    get :show, id: @feedback_response
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @feedback_response
    assert_response :success
  end

  test "should update feedback_response" do
    patch :update, id: @feedback_response, feedback_response: { meeting_id: @feedback_response.meeting_id, rating: @feedback_response.rating }
    assert_redirected_to feedback_response_path(assigns(:feedback_response))
  end

  test "should destroy feedback_response" do
    assert_difference('FeedbackResponse.count', -1) do
      delete :destroy, id: @feedback_response
    end

    assert_redirected_to feedback_responses_path
  end
end
