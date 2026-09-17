use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

fun choose-hat(temp :: Number) -> String:
  doc: "returns a message describing temperature appropriate headgear"
  if temp >= 85:
    "sun hat"
  else if temp <= 50:
    "winter hat"
  else:
    "no hat"
  end
  
  where:
  choose-hat(40) is "winter hat"
  choose-hat(84.9) is "no hat"
  choose-hat(85) is "sun hat"
end

fun add-glasses(outfit :: String) -> String:
  doc: "returns message containing outfit added to glasses"
  outfit + ", and glasses"
end

fun choose-outfit(temp :: Number) -> String:
  add-glasses(choose-hat(temp))
end

fun hat-or-visor(temp :: Number, has-visor :: Boolean) -> String:
  if (has-visor == true) and (temp > 95):
    "visor"
  else: 
    choose-hat(temp)
  end
end

fun choose-fit-visor(temp :: Number, visor :: Boolean) -> String:
  add-glasses(hat-or-visor(temp, visor))
end
