require "test_helper"

class DashboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get student" do
    get dashboards_student_url
    assert_response :success
  end

  test "should get teacher" do
    get dashboards_teacher_url
    assert_response :success
  end

  test "should get recruiter" do
    get dashboards_recruiter_url
    assert_response :success
  end
end
