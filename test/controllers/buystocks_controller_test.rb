require "test_helper"

class BuystocksControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get buystocks_edit_url
    assert_response :success
  end

  test "should get update" do
    get buystocks_update_url
    assert_response :success
  end
end
