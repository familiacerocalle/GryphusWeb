require "application_system_test_case"

class ComplaintUsersTest < ApplicationSystemTestCase
  setup do
    @complaint_user = complaint_users(:one)
  end

  test "visiting the index" do
    visit complaint_users_url
    assert_selector "h1", text: "Complaint Users"
  end

  test "creating a Complaint user" do
    visit complaint_users_url
    click_on "New Complaint User"

    fill_in "Comentarios", with: @complaint_user.comentarios
    fill_in "Complaint", with: @complaint_user.complaint_id
    fill_in "Direccion", with: @complaint_user.direccion
    fill_in "User", with: @complaint_user.user_id
    click_on "Create Complaint user"

    assert_text "Complaint user was successfully created"
    click_on "Back"
  end

  test "updating a Complaint user" do
    visit complaint_users_url
    click_on "Edit", match: :first

    fill_in "Comentarios", with: @complaint_user.comentarios
    fill_in "Complaint", with: @complaint_user.complaint_id
    fill_in "Direccion", with: @complaint_user.direccion
    fill_in "User", with: @complaint_user.user_id
    click_on "Update Complaint user"

    assert_text "Complaint user was successfully updated"
    click_on "Back"
  end

  test "destroying a Complaint user" do
    visit complaint_users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Complaint user was successfully destroyed"
  end
end
