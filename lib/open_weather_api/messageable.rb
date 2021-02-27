require 'active_model'
require 'date'
require 'open_weather_api/open_weather_api'

module OpenWeatherApi
  class Messageable
    include ActiveModel::Serializers::JSON

    def initialize(options = {})
      @options = options
      @forecast = open_weather_api.new(@options).forecast
      @weather = open_weather_api.new(@options).weather
    end

    def forecast
      @forecast
    end

    def weather
      @weather
    end

    def prevision
      "#{temp_now}. #{average_weather} "
    end


    private

    def open_weather_api
      ::OpenWeatherApi::OpenWeatherApi
    end



    def temp_type
      case @options[:units]
        when 'metric' then 'ºC'
        when 'imperial' then 'ºF'
        else ''
      end
    end

    def temp_now
      "#{weather.main['temp'].round(1)}#{temp_type} e #{weather.weather.last['description']} em #{weather.name} em  #{forecast.convert_date(weather.dt).strftime("%d/%m")}"
    end

    #FIXME: workarround to be fixed
    def average_weather
      message = "Média para os proximos dias: "
      5.times do |t|
        date = Date.today + 1 + t
        message += forecast.average_temperature(date).to_s
        message += temp_type
        message += " em "
        message += date.strftime("%d/%m").to_s
        message += "#{t == 4 ? '.' : ',' } "
      end
      message
    end

  end
end