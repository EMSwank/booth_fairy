class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @conn = Faraday.new(url: "https://api.darksky.net")
    response = @conn.get("/forecast/#{ENV["DARK_SKY_API_KEY"]}/39.7391428,-104.984696")
    @weather = JSON.parse(response.body, symbolize_names: true)
    @forecast = @weather[:daily][:data].map do |day|
      [Time.at(day[:time]).strftime("%a"), day[:temperatureHigh].round, day[:temperatureLow].round]
    end
  end
end