require "test_helper"

class Teacher::DashboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get teacher" do
    get teacher_dashboards_teacher_url
    assert_response :success
  end
end
