require 'open_weather_api/open_weather_api'
#require 'OpenWeatherAPI'

RSpec.describe OpenWeatherApi::OpenWeatherApi do
  context 'weather' do
    before do
      @params = {
        q: 'São Paulo',
        units:'metric',
        lang:'pt_br',
        appid: 'c26591317877a7d9348e3b745aee5b8b'
      }
    end
    it 'check existing weather' do
      @weather = OpenWeatherApi::OpenWeatherApi.new(@params).weather
      expect(@weather.cod).to eq(200)
      expect(@weather.temperature).to_not eq(nil)
      expect(@weather.error).to eq(nil)
    end

    it 'check non existing weather' do
      params = {
        q: 'xyz',
        units:'metric',
        lang:'pt_br',
        appid: 'c26591317877a7d9348e3b745aee5b8b'
      }
      @weather = OpenWeatherApi::OpenWeatherApi.new(params).weather
      expect(@weather.cod).to eq("404")
      expect(@weather.error).to eq('city not found')
    end
  end

  context 'forecast' do
    before do
      @params = {
        q: 'São Paulo',
        units:'metric',
        lang:'pt_br',
        appid: 'c26591317877a7d9348e3b745aee5b8b'
      }
    end
    it 'check existing forecast' do
      response = OpenWeatherApi::OpenWeatherApi.new(@params).forecast
      expect(response['cod']).to eq("200")
      expect(response['city']['country']).to eq('BR')
    end

    it 'check non existing forecast' do
      params = {
        q: 'xyz',
        units:'metric',
        lang:'pt_br',
        appid: 'c26591317877a7d9348e3b745aee5b8b'
      }
      response = OpenWeatherApi::OpenWeatherApi.new(params).forecast
      expect(response['cod']).to eq("404")
      expect(response['message']).to eq('city not found')
    end
  end
end