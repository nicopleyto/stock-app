require "test_helper"

class PortfolioStocksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get portfolio_stocks_index_url
    assert_response :success
  end
end
