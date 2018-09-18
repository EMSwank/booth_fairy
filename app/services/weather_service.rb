require 'barometer'

class WeatherService
  attr_reader :current_temp, :condition

  def initialize(query)
    @query = query
  end

  def get_weather
    weather = Barometer.new(@query)
    weather.measure
  end

  def current_temp
    get_weather.responses.first.current.temperature.f
  end

  def condition
    get_weather.responses.first.current.condition
  end
end