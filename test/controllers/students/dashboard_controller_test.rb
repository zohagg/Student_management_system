require "test_helper"

class Students::DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get students_dashboard_index_url
    assert_response :success
  end
end
