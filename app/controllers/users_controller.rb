class UsersController < ApplicationController
  def index
    @user = current_user
    @weather_forecast = WeatherService.new('Denver')
  end
end
