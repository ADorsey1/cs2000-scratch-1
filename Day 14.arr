use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
include csv
import lists as L

discount-codes = [list: "NEWYEAR", "student", "NONE", "student", "VIP", "none"]

unique-codes = L.distinct(discount-codes)

fun is-real-code(code :: String) -> Boolean:
  not(string-to-lower(code) == "none")
end

real-codes = L.filter(is-real-code, unique-codes)

first-code = L.get(real-codes,0)

lower-codes = L.map(string-to-lower, real-codes)

upper-codes = L.map(string-to-upper, unique-codes)

answers = [list: "yes", "NO", "maybe", "Yes", "no", "Maybe"]

unique-ans = L.distinct(answers)
lower-ans = L.map(string-to-lower, unique-ans)

fun is-not-maybe(ans :: String) -> Boolean:
  not(ans == "maybe")
end

real-ans = L.filter(is-not-maybe, lower-ans)

  products =
  table: name :: String, price :: Number
    row: "laptop", 999.99
    row: "mouse", 25.50
    row: "keyboard", 75.00
    row: "monitor", 299.99
  end

L.map(lam(p :: Number) -> Number: if p < 100: p * 0.9 else: p end end, extract price from products end)

fruits = [list: "apple", "banana", "cherry", "date", "elderberry"]

L.get(fruits, 2)

L.filter(lam(s :: String) -> Boolean: string-length(s) > 5 end, fruits)

earnings-report = load-table:
Name :: String,
Department-Name :: String,
Title :: String,
Regular :: String,
Retro :: String,
Other :: String,
Overtime :: String,
Injured :: String,
Detail :: String,
Quinn-Education :: String,
Total-Gross :: String,
Postal :: String
source: csv-table-url("https://data.boston.gov/dataset/418983dc-7cae-42bb-88e4-d56f5adcf869/resource/29b3544f-752a-4cb1-a6af-a1de153d20a0/download/employee-earnings-report-2025.csv", default-options)
end

L.filter(lam(s :: String) -> Boolean: string-contains(s, "Smith") end, extract Name from earnings-report end)

students = [list: "alice", "Bob", "CHARLIE", "diana"]

L.map(lam(n :: String) -> String: string-toupper(string-substring(n, 0, 1)) + string-tolower(string-substring(n, 1, string-length(n))) end, students)

L.length(L.filter(lam(s :: String) -> Boolean: string-contains(s, "Smith") end, extract Name from earnings-report end))