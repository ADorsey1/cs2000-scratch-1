use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
# Intro
data Payment:
  | cash
  | card(card-number :: String, expiry :: String)
  | venmo
  | checks(account-num :: String, routing :: String)
end

p1 = cash
p2 = venmo
p3= card("124123412341234", "11/29")
p4 = checks("234234234", "432432432")

fun payment-to-str(p :: Payment) -> String:
  doc: "describes the payment"
  cases (Payment) p:
    | cash => "Paid in cash"
    | card(card-number, expiry) => "Paid by credit card expiring on " + expiry
    | checks(account-num, routing) => "Paid by check from account " + account-num
  end
end

# 1 & 2

data Vehicle:
  | bike
  | car(make :: String, year :: Number)
  | truck(make :: String, year :: Number, capacity :: String)
end

b = bike
c1 = car("chevrolet cruz", 2018)
t1 = truck("Ford F-150 cruz", 2009, "6")

fun vehicle-age(v :: Vehicle, y :: Number) -> Number:
  cases (Vehicle) v: 
    | bike => 0
    | car(make, year) => y - year
    | truck(make, year, capacity) => y - year
  end
end

# 3 & 4
data Grade:
  | letter(grade :: String)
  | percent(grade :: Number)
  | pass-fail(grade :: Boolean)
end

g1 = letter("B")
g2 = percent(93)
g3 = pass-fail(false)

fun grade-to-gpa(g :: Grade):
  cases (Grade) g:
    | letter(grade) => 
      if grade == "A": "4.0" 
      else if grade == "B": "3.0" 
      else if grade == "C": "2.0" 
      else if grade == "D": "1.0" 
      else: "0.0"
      end
    | percent(grade) =>
      if grade >= 90: "4.0" 
      else if grade >= 80: "3.0" 
      else if grade >= 70 : "2.0" 
      else if grade >= 60: "1.0" 
      else: "0.0"
      end
    | pass-fail(grade) =>
      if grade:
        "4.0"
      else:
        "0.0"
      end
  end
end
       
# 5.
fun payment-summary(p :: Payment) -> String:
  cases (Payment) p:
    | cash => "Cash payment"
    | card(card-number, expiry) => "Card ending in " + string-substring(card-number, string-length(card-number) - 4, string-length(card-number))
    | checks(account-num, routing) => "Check #" + routing
    | venmo => "Venmo transfer"
  end
end

# 6. 
data WeatherReport:
  | sunny(temp :: Number)
  | rainy(temp :: Number, precip :: Number)
  | snowy(temp :: Number, precip :: Number, wind-speed :: Number)
end

w1 = sunny(87)
w2 = rainy(52, 2.1)
w3 = snowy(12, 6, 35)

fun is-severe(w :: WeatherReport) -> Boolean:
  cases (WeatherReport) w:
    | sunny(temp) => temp > 95
    | rainy(temp, precip) => precip > 2
    | snowy(temp, precip, wind-speed) => wind-speed > 30
  end
end