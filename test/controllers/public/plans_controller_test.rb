require "test_helper"

class Public::PlansControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_plans_index_url
    assert_response :success
  end

  test "should get show" do
    get public_plans_show_url
    assert_response :success
  end
end
