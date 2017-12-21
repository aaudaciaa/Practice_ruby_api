require 'forecast_io'

ForecastIO.configure do |configuration|
  configuration.api_key = 'input-your-api-key'
end

forecast = ForecastIO.forecast(37.501519, 127.039666)
f = forecast.currently

def f_to_c(fire)
  fire = fire.to_f
  ((fire - 32) * 5 / 9).round(2)
end

puts f.summary
puts f_to_c f.temperature
