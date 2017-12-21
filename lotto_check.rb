require 'open-uri'
require 'json'



url = "http://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo="
page = open(url).read
info = JSON.parse(page)

# 1. 현재 info hash에 있는 값을 luck_numbers에 넣는다.
luck_numbers = [] #이번주 추첨한 로또 번호 6개
bonus_number = info["bnusNo"]
my_numbers = (1..45).to_a.sample(6) # my_numbers = [*1..45].sample 6 과 같은 의미
number = 0


info.each do |key, value|
  # if key.include("drwtNo")
  #   luck_numbers << value
  # end

  luck_numbers << value if key.include?('drwtNo')
end
luck_numbers.sort!

# 2. luck_numbers와 bonus_number를 사용하여 우리가 뽑은 번호와 비교
match_number = my_numbers&luck_numbers
match_count = match_number.count

# if match_count ==  6
#   puts '1등'
# elsif match_count == 5 && my_numbers.include? bonus_number
#   puts '2등'
# elsif match_count == 5
#   puts '3등'
# elsif match_count == 4
#   puts '4등'
# elsif match_count == 3
#   puts '5등'
# else
#   puts '꽝'
# end

result =
          case[match_count, my_numbers.include?(bonus_number)]
          when[6, false] then '1등'
          when[5, true] then '2등'
          when[5, false] then '3등'
          when[4, false] then '4등'
          when[3, false] then '5등'
          else '꽝'
          end
puts result
