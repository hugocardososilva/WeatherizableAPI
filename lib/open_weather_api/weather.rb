require 'active_model'

module OpenWeatherApi
  class Weather
    include ActiveModel::Serializers::JSON

    attr_accessor :id, :coord, :weather, :main, :base, :visibility, :wind,
    :clouds, :dt, :sys, :timezone, :name, :cod, :message

    def attributes=(hash)
      hash.each do |key, value|
        send("#{key}=", value)
      end
    end

    def attributes
      instance_values
    end

    def error?
      true unless cod.eq 200
    end

    def error
      message
    end

    def temperature
      main['temp'].to_f
    end

  end
end