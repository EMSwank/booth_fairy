require 'barometer'

class WeatherService
  attr_reader :five_day, :current_temp, :condition

  def initialize(query)
    @query = query
    @five_day = five_day
  end

  def get_weather
    weather = Barometer.new(@query)
    weather.measure
    binding.pry
  end

  def current_temp
    get_weather.responses.first.current.temperature.f
  end

  def five_day
    get_weather.forecast
  end

  def condition
    get_weather.responses.first.condition
  end
end