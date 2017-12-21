require 'stock_quote'

# companies = ['AAPL', 'FB', 'TSLA', 'GOOGL', 'AMZN']

DATA.each do |company|
  company.chomp!
  stock = StockQuote::Stock.quote(company)
  puts stock.name
  puts stock.l
end

#이걸 만나면 루비가 이 파일이 다 끝났다고 인식을 한다. END밑에는 루비코드가 아니다. 위에 루비코드에서 END아래는 전부 DATA로 인식
__END__
AAPL
FB
TSLA
GOOGL
AMZN
