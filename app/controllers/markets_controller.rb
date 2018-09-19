class MarketsController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = current_user
    @market = Market.new
  end

  def create
    @market = Market.create!(market_params)
    redirect_to markets_path
  end

  private

  def market_params
    params.permit(:name, :street_address)
    params[:market]["user_id"] = user_id
  end

  def user_id
    current_user.id
  end
end
