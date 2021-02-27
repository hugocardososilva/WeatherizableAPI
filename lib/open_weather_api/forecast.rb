require 'active_model'
require 'date'

module OpenWeatherApi
  class Forecast
    include ActiveModel::Serializers::JSON

    attr_accessor :id, :params, :attributes, :cod, :message, :cnt, :list, :city, :main, :rain


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

    def split_day(date)
      day = []
      list.each do |item|
        if convert_date(item['dt']) == date
          day << item
        end
      end
      day
    end

    def average_temperature(date)
      temp = 0
      split_day(date).each do |item|
        temp += item['main']['temp']
      end
      (temp / split_day(date).count).round(1)
    end

    def convert_date(timestamp)
      Time.at(timestamp).to_date
    end

  end
end