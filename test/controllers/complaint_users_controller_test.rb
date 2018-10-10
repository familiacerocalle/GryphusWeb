require 'test_helper'

class ComplaintUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @complaint_user = complaint_users(:one)
  end

  test "should get index" do
    get complaint_users_url
    assert_response :success
  end

  test "should get new" do
    get new_complaint_user_url
    assert_response :success
  end

  test "should create complaint_user" do
    assert_difference('ComplaintUser.count') do
      post complaint_users_url, params: { complaint_user: { comentarios: @complaint_user.comentarios, complaint_id: @complaint_user.complaint_id, direccion: @complaint_user.direccion, user_id: @complaint_user.user_id } }
    end

    assert_redirected_to complaint_user_url(ComplaintUser.last)
  end

  test "should show complaint_user" do
    get complaint_user_url(@complaint_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_complaint_user_url(@complaint_user)
    assert_response :success
  end

  test "should update complaint_user" do
    patch complaint_user_url(@complaint_user), params: { complaint_user: { comentarios: @complaint_user.comentarios, complaint_id: @complaint_user.complaint_id, direccion: @complaint_user.direccion, user_id: @complaint_user.user_id } }
    assert_redirected_to complaint_user_url(@complaint_user)
  end

  test "should destroy complaint_user" do
    assert_difference('ComplaintUser.count', -1) do
      delete complaint_user_url(@complaint_user)
    end

    assert_redirected_to complaint_users_url
  end
end
