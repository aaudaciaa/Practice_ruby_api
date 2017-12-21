require 'stock_quote'
require 'eu_central_bank'

@bank = EuCentralBank.new

def usd_to_krw(volume)
  @bank.update_rates
  rate = @bank.exchange(100, 'USD', 'KRW').to_f
  result = (volume.to_f * rate).round(1)
end

ARGV.each do |company| #ARGV라고 하면 콘솔창에서 ruby stock_currency.rb하고 뒤에 넣는 값이 ARGV에 들어간다.
  # company.chomp!
  stock = StockQuote::Stock.quote(company)

  puts "#{stock.name}의 가격은 #{usd_to_krw(stock.l)}원 입니다"
end
