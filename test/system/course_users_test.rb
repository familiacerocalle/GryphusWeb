require "application_system_test_case"

class CourseUsersTest < ApplicationSystemTestCase
  setup do
    @course_user = course_users(:one)
  end

  test "visiting the index" do
    visit course_users_url
    assert_selector "h1", text: "Course Users"
  end

  test "creating a Course user" do
    visit course_users_url
    click_on "New Course User"

    fill_in "Course", with: @course_user.course_id
    fill_in "Fechafin", with: @course_user.fechafin
    fill_in "Fechainicio", with: @course_user.fechainicio
    fill_in "User", with: @course_user.user_id
    click_on "Create Course user"

    assert_text "Course user was successfully created"
    click_on "Back"
  end

  test "updating a Course user" do
    visit course_users_url
    click_on "Edit", match: :first

    fill_in "Course", with: @course_user.course_id
    fill_in "Fechafin", with: @course_user.fechafin
    fill_in "Fechainicio", with: @course_user.fechainicio
    fill_in "User", with: @course_user.user_id
    click_on "Update Course user"

    assert_text "Course user was successfully updated"
    click_on "Back"
  end

  test "destroying a Course user" do
    visit course_users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Course user was successfully destroyed"
  end
end
