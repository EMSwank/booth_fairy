class UsersController < ApplicationController
  def index
    @user = current_user
    weather = WeatherService.new('Denver')
    @weather_forecast = weather.current_temp
  end
end
