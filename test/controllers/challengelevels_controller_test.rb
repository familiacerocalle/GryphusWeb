require 'test_helper'

class ChallengelevelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @challengelevel = challengelevels(:one)
  end

  test "should get index" do
    get challengelevels_url
    assert_response :success
  end

  test "should get new" do
    get new_challengelevel_url
    assert_response :success
  end

  test "should create challengelevel" do
    assert_difference('Challengelevel.count') do
      post challengelevels_url, params: { challengelevel: { descripcion: @challengelevel.descripcion, puntos: @challengelevel.puntos } }
    end

    assert_redirected_to challengelevel_url(Challengelevel.last)
  end

  test "should show challengelevel" do
    get challengelevel_url(@challengelevel)
    assert_response :success
  end

  test "should get edit" do
    get edit_challengelevel_url(@challengelevel)
    assert_response :success
  end

  test "should update challengelevel" do
    patch challengelevel_url(@challengelevel), params: { challengelevel: { descripcion: @challengelevel.descripcion, puntos: @challengelevel.puntos } }
    assert_redirected_to challengelevel_url(@challengelevel)
  end

  test "should destroy challengelevel" do
    assert_difference('Challengelevel.count', -1) do
      delete challengelevel_url(@challengelevel)
    end

    assert_redirected_to challengelevels_url
  end
end
