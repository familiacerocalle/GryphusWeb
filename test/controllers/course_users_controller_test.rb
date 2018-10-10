require 'test_helper'

class CourseUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course_user = course_users(:one)
  end

  test "should get index" do
    get course_users_url
    assert_response :success
  end

  test "should get new" do
    get new_course_user_url
    assert_response :success
  end

  test "should create course_user" do
    assert_difference('CourseUser.count') do
      post course_users_url, params: { course_user: { course_id: @course_user.course_id, fechafin: @course_user.fechafin, fechainicio: @course_user.fechainicio, user_id: @course_user.user_id } }
    end

    assert_redirected_to course_user_url(CourseUser.last)
  end

  test "should show course_user" do
    get course_user_url(@course_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_user_url(@course_user)
    assert_response :success
  end

  test "should update course_user" do
    patch course_user_url(@course_user), params: { course_user: { course_id: @course_user.course_id, fechafin: @course_user.fechafin, fechainicio: @course_user.fechainicio, user_id: @course_user.user_id } }
    assert_redirected_to course_user_url(@course_user)
  end

  test "should destroy course_user" do
    assert_difference('CourseUser.count', -1) do
      delete course_user_url(@course_user)
    end

    assert_redirected_to course_users_url
  end
end
