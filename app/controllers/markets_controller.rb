class MarketsController < ApplicationController
  before_action :authenticate_user!

  def new
    @market = Market.new
  end
end
