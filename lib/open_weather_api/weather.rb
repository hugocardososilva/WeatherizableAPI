require 'active_model'

module OpenWeatherApi
  class Weather
    include ActiveModel::Serializers::JSON

    attr_accessor :id, :coord, :weather, :main, :base, :visibility, :wind,
    :clouds, :dt, :sys, :timezone, :name, :cod

    def attributes=(hash)
      hash.each do |key, value|
        send("#{key}=", value)
      end
    end

    def attributes
      instance_values
    end
  end
end