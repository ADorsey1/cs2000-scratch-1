use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
reg-layer = rectangle(120, 30, "solid", "pink")
layer-2-reg = above(reg-layer, reg-layer)
layer-3-reg = above(reg-layer, layer-2-reg)

cake-2-1 = rectangle(120, 30, "solid", "red")
cake-2-2 = above(rectangle(120, 30, "solid", "white"), cake-2-1)
cake-2-3 = above(rectangle(120, 30, "solid", "blue"), cake-2-2)

fun three-layer-cake(top, mid, bot :: String) -> Image:
  cake-1 = rectangle(120, 30, "solid", bot)
  cake-2 = above(rectangle(120, 30, "solid", mid), cake-1)
  cake-3 = above(rectangle(120, 30, "solid", top), cake-2)
  cake-3
end

fun tshirt-cost(n-tees :: Number, message :: String) -> Number:
  n-let = string-length(string-replace(message, " ", ""))
  per-tee = (0.1 * n-let) + 5.00
  total = per-tee * n-tees
  total
end