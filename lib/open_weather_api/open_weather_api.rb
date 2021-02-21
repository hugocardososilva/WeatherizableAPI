require 'faraday'
require 'json'
require 'open_weather_api/weather'

module OpenWeatherApi
  class OpenWeatherApi
    URL = ENV['OPEN_WEATER_API_URL'] || 'https://api.openweathermap.org/data/2.5/'

    def initialize(options = {})
      @options = options
    end

    def weather
      url = URL+'weather'
      @weather = ::OpenWeatherApi::Weather.new.from_json(get(url, @options).body)
      @weather.params = @options
      @weather
    end

    def forecast
      url = URL+'forecast'
      JSON.parse(get(url, @options).body)
    end

    protected

    def get(url, params)
      Faraday.get(url) do |req|
        params.each do |key, value|
          req.params[key] = value
        end
        req.headers['Accept'] = 'application/json'
      end
    end

  end
end