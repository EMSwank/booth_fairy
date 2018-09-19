class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    weather = WeatherService.new("39.7391428,-104.984696")
    @weather = weather.parse_weather
    @forecast = weather.forecast
  end
end