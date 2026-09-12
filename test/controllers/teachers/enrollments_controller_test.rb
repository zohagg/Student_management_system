require "test_helper"

class Teachers::EnrollmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get teachers_enrollments_index_url
    assert_response :success
  end

  test "should get approve" do
    get teachers_enrollments_approve_url
    assert_response :success
  end

  test "should get reject" do
    get teachers_enrollments_reject_url
    assert_response :success
  end
end
