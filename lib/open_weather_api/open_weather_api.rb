require 'faraday'
require 'json'
require 'open_weather_api/weather'

module OpenWeatherApi
  class OpenWeatherApi
    API_KEY = ENV['OPEN_WEATER_API_KEY'] || 'c26591317877a7d9348e3b745aee5b8b'
    URL = ENV['OPEN_WEATER_API_URL'] || 'https://api.openweathermap.org/data/2.5/'

    def initialize(options = {})
      @options = options
      @params = api_params
    end

    def weather
      url = URL+'weather'
      ::OpenWeatherApi::Weather.new.from_json(get(url, @params).body)
    end

    def forecast
      url = URL+'forecast'
      JSON.parse(get(url, @params).body)
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

    def api_params
      @options.merge(appid: API_KEY)
    end

  end
end