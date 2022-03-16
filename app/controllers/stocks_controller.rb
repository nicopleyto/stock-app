#create method to populate model, store methods temporarily in seeds.rb (ask sir where to place the method and how to initialize client)
#edit the necessary controller methods

class StocksController < ApplicationController
  before_action :initialize_client

  def index
    @stocks = Stock.all
    #@stocksdata = @stocks.map{|stock| @client.quote(stock.symbol)}
  end

  def show
    @stock = Stock.find(params[:id])
  end

  private

  def initialize_client
    @client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.publishable_token,
      secret_token: Rails.application.credentials.secret_token,
      endpoint: 'https://cloud.iexapis.com/v1'
    )
  end
end