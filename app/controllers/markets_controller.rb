class MarketsController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = current_user
    @market = Market.new
  end

  def create
    @user = current_user
    @market = @user.markets.create!(market_params)
    redirect_to markets_path
  end

  private

  def market_params
    params.require(:market).permit(:name, :street_address, :user_id)
  end

end