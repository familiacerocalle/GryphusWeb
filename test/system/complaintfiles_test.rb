require "application_system_test_case"

class ComplaintfilesTest < ApplicationSystemTestCase
  setup do
    @complaintfile = complaintfiles(:one)
  end

  test "visiting the index" do
    visit complaintfiles_url
    assert_selector "h1", text: "Complaintfiles"
  end

  test "creating a Complaintfile" do
    visit complaintfiles_url
    click_on "New Complaintfile"

    fill_in "Archivo", with: @complaintfile.archivo
    fill_in "Complaint User", with: @complaintfile.complaint_user_id
    fill_in "Descripcion", with: @complaintfile.descripcion
    click_on "Create Complaintfile"

    assert_text "Complaintfile was successfully created"
    click_on "Back"
  end

  test "updating a Complaintfile" do
    visit complaintfiles_url
    click_on "Edit", match: :first

    fill_in "Archivo", with: @complaintfile.archivo
    fill_in "Complaint User", with: @complaintfile.complaint_user_id
    fill_in "Descripcion", with: @complaintfile.descripcion
    click_on "Update Complaintfile"

    assert_text "Complaintfile was successfully updated"
    click_on "Back"
  end

  test "destroying a Complaintfile" do
    visit complaintfiles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Complaintfile was successfully destroyed"
  end
end
