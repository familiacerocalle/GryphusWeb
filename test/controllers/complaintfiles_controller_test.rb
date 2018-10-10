require 'test_helper'

class ComplaintfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @complaintfile = complaintfiles(:one)
  end

  test "should get index" do
    get complaintfiles_url
    assert_response :success
  end

  test "should get new" do
    get new_complaintfile_url
    assert_response :success
  end

  test "should create complaintfile" do
    assert_difference('Complaintfile.count') do
      post complaintfiles_url, params: { complaintfile: { archivo: @complaintfile.archivo, complaint_user_id: @complaintfile.complaint_user_id, descripcion: @complaintfile.descripcion } }
    end

    assert_redirected_to complaintfile_url(Complaintfile.last)
  end

  test "should show complaintfile" do
    get complaintfile_url(@complaintfile)
    assert_response :success
  end

  test "should get edit" do
    get edit_complaintfile_url(@complaintfile)
    assert_response :success
  end

  test "should update complaintfile" do
    patch complaintfile_url(@complaintfile), params: { complaintfile: { archivo: @complaintfile.archivo, complaint_user_id: @complaintfile.complaint_user_id, descripcion: @complaintfile.descripcion } }
    assert_redirected_to complaintfile_url(@complaintfile)
  end

  test "should destroy complaintfile" do
    assert_difference('Complaintfile.count', -1) do
      delete complaintfile_url(@complaintfile)
    end

    assert_redirected_to complaintfiles_url
  end
end
