require "application_system_test_case"

class ActivityNamesTest < ApplicationSystemTestCase
  setup do
    @activity_name = activity_names(:one)
  end

  test "visiting the index" do
    visit activity_names_url
    assert_selector "h1", text: "Activity names"
  end

  test "should create activity name" do
    visit activity_names_url
    click_on "New activity name"

    fill_in "Name", with: @activity_name.name
    click_on "Create Activity name"

    assert_text "Activity name was successfully created"
    click_on "Back"
  end

  test "should update Activity name" do
    visit activity_name_url(@activity_name)
    click_on "Edit this activity name", match: :first

    fill_in "Name", with: @activity_name.name
    click_on "Update Activity name"

    assert_text "Activity name was successfully updated"
    click_on "Back"
  end

  test "should destroy Activity name" do
    visit activity_name_url(@activity_name)
    click_on "Destroy this activity name", match: :first

    assert_text "Activity name was successfully destroyed"
  end
end
