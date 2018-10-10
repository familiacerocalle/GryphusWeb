require "application_system_test_case"

class ChallengelevelsTest < ApplicationSystemTestCase
  setup do
    @challengelevel = challengelevels(:one)
  end

  test "visiting the index" do
    visit challengelevels_url
    assert_selector "h1", text: "Challengelevels"
  end

  test "creating a Challengelevel" do
    visit challengelevels_url
    click_on "New Challengelevel"

    fill_in "Descripcion", with: @challengelevel.descripcion
    fill_in "Puntos", with: @challengelevel.puntos
    click_on "Create Challengelevel"

    assert_text "Challengelevel was successfully created"
    click_on "Back"
  end

  test "updating a Challengelevel" do
    visit challengelevels_url
    click_on "Edit", match: :first

    fill_in "Descripcion", with: @challengelevel.descripcion
    fill_in "Puntos", with: @challengelevel.puntos
    click_on "Update Challengelevel"

    assert_text "Challengelevel was successfully updated"
    click_on "Back"
  end

  test "destroying a Challengelevel" do
    visit challengelevels_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Challengelevel was successfully destroyed"
  end
end
