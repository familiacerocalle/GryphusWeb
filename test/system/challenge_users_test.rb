require "application_system_test_case"

class ChallengeUsersTest < ApplicationSystemTestCase
  setup do
    @challenge_user = challenge_users(:one)
  end

  test "visiting the index" do
    visit challenge_users_url
    assert_selector "h1", text: "Challenge Users"
  end

  test "creating a Challenge user" do
    visit challenge_users_url
    click_on "New Challenge User"

    fill_in "Challenge", with: @challenge_user.challenge_id
    fill_in "Fechafin", with: @challenge_user.fechafin
    fill_in "Fechainicio", with: @challenge_user.fechainicio
    fill_in "User", with: @challenge_user.user_id
    click_on "Create Challenge user"

    assert_text "Challenge user was successfully created"
    click_on "Back"
  end

  test "updating a Challenge user" do
    visit challenge_users_url
    click_on "Edit", match: :first

    fill_in "Challenge", with: @challenge_user.challenge_id
    fill_in "Fechafin", with: @challenge_user.fechafin
    fill_in "Fechainicio", with: @challenge_user.fechainicio
    fill_in "User", with: @challenge_user.user_id
    click_on "Update Challenge user"

    assert_text "Challenge user was successfully updated"
    click_on "Back"
  end

  test "destroying a Challenge user" do
    visit challenge_users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Challenge user was successfully destroyed"
  end
end
