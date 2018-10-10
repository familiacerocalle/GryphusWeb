require 'test_helper'

class ChallengeUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @challenge_user = challenge_users(:one)
  end

  test "should get index" do
    get challenge_users_url
    assert_response :success
  end

  test "should get new" do
    get new_challenge_user_url
    assert_response :success
  end

  test "should create challenge_user" do
    assert_difference('ChallengeUser.count') do
      post challenge_users_url, params: { challenge_user: { challenge_id: @challenge_user.challenge_id, fechafin: @challenge_user.fechafin, fechainicio: @challenge_user.fechainicio, user_id: @challenge_user.user_id } }
    end

    assert_redirected_to challenge_user_url(ChallengeUser.last)
  end

  test "should show challenge_user" do
    get challenge_user_url(@challenge_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_challenge_user_url(@challenge_user)
    assert_response :success
  end

  test "should update challenge_user" do
    patch challenge_user_url(@challenge_user), params: { challenge_user: { challenge_id: @challenge_user.challenge_id, fechafin: @challenge_user.fechafin, fechainicio: @challenge_user.fechainicio, user_id: @challenge_user.user_id } }
    assert_redirected_to challenge_user_url(@challenge_user)
  end

  test "should destroy challenge_user" do
    assert_difference('ChallengeUser.count', -1) do
      delete challenge_user_url(@challenge_user)
    end

    assert_redirected_to challenge_users_url
  end
end
