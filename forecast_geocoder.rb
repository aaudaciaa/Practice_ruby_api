require 'forecast_io'
require 'geocoder'

print '어디가 궁금하세요? : '
input = gets.chomp
loCord = Geocoder.coordinates(input)

ForecastIO.configure do |configuration|
  configuration.api_key = 'input-your-api-key'
end

forecast = ForecastIO.forecast(loCord.first, loCord.last)
f = forecast.currently

def f_to_c(fire)
  fire = fire.to_f
  ((fire - 32) * 5 / 9).round(2)
end

puts "#{input}의 현재 날씨는 #{f.summary}이며 기온은 #{f_to_c f.temperature}도 입니다."
