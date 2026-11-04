use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

fun numToStr(n :: Number) -> String:
  if n == 0:
    "0"
  else if n == 1:
    "1"
  else if n == 2:
    "2"
  else if n == 3:
    "3"
  else if n == 4:
    "4"
  else if n == 5:
    "5"
  else if n == 6:
    "6"
  else if n == 7:
    "7"
  else if n == 8:
    "8"
  else if n == 9:
    "9"
  else:
    first = num-modulo(n, 10)
    firstStr = numToStr(first)
    num = num-floor(n / 10)
    numToStr(num) + firstStr
  end
  
  
end

fun strToNum(s :: String) -> Number:
  if