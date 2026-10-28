use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
import lists as L


#double nums 

fun my-doubles(l :: List<Number>) -> List<Number> block:
  doc: "Return a new list with each value doubled"
  L.map(lam(n :: Number): n * 2 end, l)
  
  
where:
  my-doubles([list: 10, 12, 14]) is [list: 20, 24, 28]
end
  

fun doubles-loop(l :: List<Number>) -> List<Number> block:
  doc: "solves same problem through iteration"
  var result = [list: ]
 
  for each(n from l):
    result := result + [list: n * 2]
  end
  
  result
where:
    my-doubles([list: 10, 12, 14]) is [list: 20, 24, 28]
end

# string length lists

fun my-str-lens(l :: List<String>) -> List<Number> block:
  doc: "returns the lengths of each string in a list"
  var result = [list: ]
 
  for each(s from l):
    result := result + [list: string-length(s)]
  end
  
  result
where:
  my-str-lens([list: "hi", "hello"]) is [list: 2, 5]
end

fun map-str-lens(l :: List<String>) -> List<Number> block:
  doc: "returns the lengths of each string in a list"
  
  l.map(string-length, l)
    
where:
  my-str-lens([list: "hi", "hello"]) is [list: 2, 5]
end

#pos nums

fun my-alternating(l :: List) -> List block:
  
  for each(i from l):
    