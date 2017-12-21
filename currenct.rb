require 'eu_central_bank'

@bank = EuCentralBank.new

# bank.update_rates
# from = 'USD'
# to = 'KRW'
#
# result = bank.exchange(100, from, to)
#위에꺼를 아래에 exchange로 함수화했다.

def exchange(from)
  @bank.update_rates
  @bank.exchange(100, from, 'KRW')
end

puts "$1 => #{exchange('USD')}원"
