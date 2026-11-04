use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")


# Recursion intro

fun add-till-zero(l :: List<Number>) -> Number:
  cases (List) l:
    | empty      => 0 
    | link(f, r) => 
      if f == 0:
        0
      else:
        f + add-till-zero(r)
      end
    end
where:
  add-till-zero([list: 7, 3, 0, 5]) is 
    [list: 7, 3, 0, 5].first + add-till-zero([list: 7, 3, 0, 5].rest)
  add-till-zero([list:    3, 0, 5]) is     
    [list: 3, 0, 5].first + add-till-zero([list: 3, 0, 5].rest)
  add-till-zero([list:       0, 5]) is 0
  add-till-zero([list:])            is 0
end

#1. 
# fun till-zero-for(l :: List<Number>) -> Number block:
#   var total = 0
  
#   first = L.index-now(lam(x): x == 0 end, l)
  
#   for each(n from L.range(0, first)):
#       total := total + n
#   end
  
#   total
# end

#2. 
len-limit = 5
fun strings-less-than(l :: List<String>) -> List<String>:
  doc: "Returns a list containing strings with length less than len-limit"
  cases (List) l:
    | empty      => [list: ] 
    | link(f, r) => 
      if string-length(f) >= len-limit:
        strings-less-than(r)
      else:
        [list: f] + strings-less-than(r)
      end
    end
  
where:
  strings-less-than([list: "hello", "my", "name", "is", "Anthony"]) is strings-less-than([list: "my", "name", "is", "Anthony"])
  strings-less-than([list: "my", "name", "is", "Anthony"]) is [list: "my"] + strings-less-than([list: "name", "is", "Anthony"])
  strings-less-than([list: "name", "is", "Anthony"]) is [list: "name"] + strings-less-than([list: "is", "Anthony"])
  strings-less-than([list: "is", "Anthony"]) is [list: "is"] + strings-less-than([list: "Anthony"])
  strings-less-than([list: "Anthony"]) is [list: ]
end
  
#3. 

fun strings-less-for(l :: List<String>) -> List<String> block:
  var result = [list: ]
  
  for each(s from l):
    if string-length(s) < len-limit:
      result := result + [list: s]
    else:
      result := result
    end
  end
  
  result
  
where:
  strings-less-for([list: "hello", "my", "name", "is", "Anthony"]) is [list: "my", "name", "is"]
  strings-less-than([list: ]) is [list: ]
end

#4. 
fun find-error-suffix(l :: List<String>) -> List<String>:
  cases (List) l:
    | empty      => [list: ] 
    | link(f, r) => 
      if f == "error":
        link(f, r)
      else:
        find-error-suffix(r)
      end
    end
where:
  find-error-suffix([list: "the", "error", "is", "404"]) is [list: "error", "is", "404"]
end