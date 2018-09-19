class WeatherService

  def initialize(coordinates)
    @coordinates = coordinates
    @conn = Faraday.new(url: "https://api.darksky.net")
    @weather = nil
  end

  def response
    @conn.get("/forecast/#{ENV["DARK_SKY_API_KEY"]}/39.7391428,-104.984696")
  end

  def parse_weather
    JSON.parse(response.body, symbolize_names: true)
  end

  def forecast
    parse_weather[:daily][:data].map do |day|
      [Time.at(day[:time]).strftime("%a"), day[:temperatureHigh].round, day[:temperatureLow].round]
    end
  end
end