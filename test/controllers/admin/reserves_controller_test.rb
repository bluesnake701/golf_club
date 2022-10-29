require "test_helper"

class Admin::ReservesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_reserves_show_url
    assert_response :success
  end
end
