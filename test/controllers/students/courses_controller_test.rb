require "test_helper"

class Students::CoursesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get students_courses_index_url
    assert_response :success
  end

  test "should get register" do
    get students_courses_register_url
    assert_response :success
  end
end
