class SalesDayController < ApplicationController

  def new
    @sales_day = SalesDay.new
    @user = current_user
    @markets = @user.markets.all
  end

  def create
    binding.pry
  end
end