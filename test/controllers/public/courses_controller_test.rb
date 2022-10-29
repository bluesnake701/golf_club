require "test_helper"

class Public::CoursesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_courses_index_url
    assert_response :success
  end

  test "should get show" do
    get public_courses_show_url
    assert_response :success
  end
end
