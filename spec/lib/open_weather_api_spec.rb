require 'OpenWeatherAPI/OpenWeatherAPI'
#require 'OpenWeatherAPI'

RSpec.describe OpenWeatherApi::OpenWeatherApi do
  context 'weather' do
    before do
      @params = {
        q: 'São Paulo',
        units:'metric',
        lang:'pt_br'
      }
    end
    it 'check existing weather' do
      response = OpenWeatherApi::OpenWeatherApi.new(@params).weather
      expect(response['cod']).to eq(200)
      expect(response['sys']['country']).to eq('BR')
    end

    it 'check non existing weather' do
      params = {
        q: 'xyz',
        units:'metric',
        lang:'pt_br'
      }
      response = OpenWeatherApi::OpenWeatherApi.new(params).weather
      expect(response['cod']).to eq("404")
      expect(response['message']).to eq('city not found')
    end
  end
end