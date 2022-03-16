require "test_helper"

class CurrentUserTransactionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get current_user_transactions_index_url
    assert_response :success
  end
end
