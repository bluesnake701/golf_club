require "test_helper"

class Public::ReservesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_reserves_index_url
    assert_response :success
  end

  test "should get show" do
    get public_reserves_show_url
    assert_response :success
  end
end
