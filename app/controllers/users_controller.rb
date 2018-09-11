class UsersController < ApplicationController
  def index
    @user = current_user
    weather = WeatherService.new('Denver')
    @current_weather = [weather.current_temp, 
  end
end
