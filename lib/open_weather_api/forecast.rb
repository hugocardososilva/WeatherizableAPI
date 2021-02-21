require 'active_model'
require 'date'

module OpenWeatherApi
  class Forecast
    include ActiveModel::Serializers::JSON

    attr_accessor :id, :params, :attributes, :cod, :message, :cnt, :list, :city


    def attributes=(hash)
      hash.each do |key, value|
        send("#{key}=", value)
      end
    end

    def attributes
      instance_values
    end

    def error?
      true unless cod.eq "200"
    end

    def error
      message
    end

    def week_list
      list.first(5)
    end

  end
end