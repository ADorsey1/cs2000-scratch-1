use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
import lists as L

#1
fun aqi-label(n :: Number) -> String:
  if n > 100:
    "unhealthy"
  else if n > 50:
    "moderate"
  else: 
    "good"
  end
  
where:
  aqi-label(101) is "unhealthy"
  aqi-label(51) is "moderate"
  aqi-label(1) is "good"
end

#2.

fun fill-gaps(l :: List<Number>) -> List<Number> block:
  
#   var recent = if l <> [list: ]: L.get(l, 0) else: 0 end
  var counter = 0
#   var result = [list: ]

 
  for each(n from l) block:
    when counter == 0:
      L.set(l, counter, n)
    end
    
    when n == -1:
      L.set(l, counter, L.get(l, counter - 1)) 
    end
    
#     recent := L.get(l, counter)
    
    counter := counter + 1

    
  end
  
  l
  
where:
  fill-gaps([list: 40, -1, -1, 60]) is [list: 40, 40, 40, 60]
  
  fill-gaps([list: 30, 120, -1]) is [list: 30, 120, 120]
  fill-gaps([list: ]) is [list: ]
end
    
#     if n == -1 block:
#       result := result + [list: recent]
#     else:
      
#       result := result + [list: n]
#       recent := n
#     end

  

#3.

fun hour-labels(l :: List<Number>) -> List<String>:
  
  L.map(aqi-label, fill-gaps(l))
  
where:
  
  hour-labels([list: 40, -1, 120]) is [list: "good", "good", "unhealthy"]
  
  hour-labels([list: ]) is [list: ]
end

#4.

today = table: hour :: Number, aqi :: Number
  row: 8, 45
  row: 9, -1
  row: 10, 60
  row: 11, 110
  row: 12, -1
  row: 13, 90
  row: 14, -1
  row: 15, 80
end

fun air-report(t :: Table) -> String:
  
  fun is-bad(s :: String) -> Boolean:
    s == "unhealthy"
  end
  
  unhealthy = num-to-string(L.filter(is-bad, hour-labels(get-column(t, "aqi"))).length())
  
  missing = num-to-string(L.filter(lam(n :: Number) -> Boolean: n == -1 end, get-column(t, "aqi")).length())
  
  "Unhealthy hours: " + unhealthy + ", missing readings: " + missing 
  
where:
  air-report(today) is "Unhealthy hours: 2, missing readings: 3"
  
end

#5.

# fun aqi-strip(l :: List<Number>) -> Image:
  
#   var result = empty-image
  
  