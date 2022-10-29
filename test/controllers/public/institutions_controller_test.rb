require "test_helper"

class Public::InstitutionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_institutions_index_url
    assert_response :success
  end

  test "should get show" do
    get public_institutions_show_url
    assert_response :success
  end
end
