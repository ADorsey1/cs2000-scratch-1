use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

fun app(l :: List, x) -> List:
  l + [list: x]
end

# Usage
check:
  app([list: 1, 2, 3], 4) is [list: 1, 2, 3, 4]
end
