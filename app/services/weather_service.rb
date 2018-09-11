require 'barometer'

class WeatherService
  attr_reader :five_day

  def initialize(query)
    @query = query
    @five_day = five_day
  end

  def get_weather
    weather = Barometer.new(@query)
    weather.measure
  end

  def current_temp
    get_weather.current.temperature
  end

  def five_day
    get_weather.forecast
  end
end