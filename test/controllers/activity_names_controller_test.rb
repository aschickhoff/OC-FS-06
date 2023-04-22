require "test_helper"

class ActivityNamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @activity_name = activity_names(:one)
  end

  test "should get index" do
    get activity_names_url
    assert_response :success
  end

  test "should get new" do
    get new_activity_name_url
    assert_response :success
  end

  test "should create activity_name" do
    assert_difference("ActivityName.count") do
      post activity_names_url, params: { activity_name: { name: @activity_name.name } }
    end

    assert_redirected_to activity_name_url(ActivityName.last)
  end

  test "should show activity_name" do
    get activity_name_url(@activity_name)
    assert_response :success
  end

  test "should get edit" do
    get edit_activity_name_url(@activity_name)
    assert_response :success
  end

  test "should update activity_name" do
    patch activity_name_url(@activity_name), params: { activity_name: { name: @activity_name.name } }
    assert_redirected_to activity_name_url(@activity_name)
  end

  test "should destroy activity_name" do
    assert_difference("ActivityName.count", -1) do
      delete activity_name_url(@activity_name)
    end

    assert_redirected_to activity_names_url
  end
end
