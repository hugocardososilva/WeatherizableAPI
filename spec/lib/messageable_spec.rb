require 'open_weather_api/messageable'

RSpec.describe OpenWeatherApi::Messageable do
  context 'messageable' do
    before do
      @params = {
        q: 'São Paulo',
        units:'metric',
        lang:'pt_br',
        appid: 'c26591317877a7d9348e3b745aee5b8b'
      }
    end
    it 'check messageable' do
      messageable = OpenWeatherApi::Messageable.new(@params)
      expect(messageable.forecast.class).to eq(OpenWeatherApi::Forecast)
      expect(messageable.weather.class).to eq(OpenWeatherApi::Weather)
      expect(messageable.weather.cod).to eq(200)
      expect(messageable.forecast.cod).to eq("200")
      expect(messageable.prevision).to_not eq('')
    end

    it 'check non existing forecast' do
      params = {
        q: 'xyz',
        units:'metric',
        lang:'pt_br',
        appid: 'c26591317877a7d9348e3b745aee5b8b'
      }
      forecast = OpenWeatherApi::OpenWeatherApi.new(params).forecast
      expect(forecast.cod).to eq("404")
      expect(forecast.error).to eq('city not found')
    end
  end
end