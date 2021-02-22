# WeatherizableAPI

This is a gem that aims to receive weather information according to the search options.

The main feature is to receive a descriptive text containing the current temperature and the weather forecast for the next 5 days. So you can prepare yourself and not be caught off guard by weather changes

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'weatherizableAPI'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install weatherizableAPI

## Usage

First you need to create an account on [openweathermap](https://openweathermap.org/) and create an [API key](https://home.openweathermap.org/api_keys)

```ruby
require 'open_weather_api/messageable'

params = {
  q: 'São Paulo',
  units:'metric', # metric for ºC, imperial for ºF
  lang:'pt_br',
  appid: 'YOUR_API_KEY'
}
messageable = OpenWeatherApi::Messageable.new(@params)
messageable.prevision
=> "20.5ºC e nublado em 2021-02-22. Média para os proximos dias: 33.1ºC em 2021-02-23, 33.4ºC em 2021-02-24, 30.9ºC em 2021-02-25, 29.6ºC em 2021-02-26, 6.6ºC em 2021-02-27,  "

```

###Note: In this release we only have answers in Brazilian Portuguese

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/weatherizableAPI. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/weatherizableAPI/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
