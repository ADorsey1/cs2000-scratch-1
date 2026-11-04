use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
import lists as L

fun my-sum(num-list :: List<Number>) -> Number block:
  var total = 0
  for each(n from num-list):
    total := total + n
  end
  total
where:
  my-sum([list: 0, 1, 2, 3]) is 6
end
    

#product of list
fun my-prod(num-list :: List<Number>) -> Number block:
  var total = 1
  for each(n from num-list):
    total := total * n
  end
  total
where:
  my-prod([list: 1, 2, 3, 4]) is 24
end

#sum of even numbers in list
fun sum-even-numbers(nums :: List<Number>) -> Number block:
  var evenSum = 0
  for each(n from nums):
    if num-modulo(n, 2) == 0:
      evenSum := evenSum + n
    else:
      evenSum
    end
  end
  evenSum
where:
  sum-even-numbers([list: 1, 4, 7, 8, 99999]) is 12
end

#length of list
fun my-length(l :: List) -> Number block:
  var len = 0
  for each(n from l):
    len := len + 1
  end
  len
where:
  my-length([list: 1, 2, 3]) is 3
end

#is there negative nums in list
fun any-negative(nums :: List<Number>) -> Boolean block:
  var neg = false
  for each(n from nums):
    when n < 0:
      neg := true
    end
  end
  neg
end

#are all words in list less than 5 letters
fun all-short-words(l :: List<String>) -> Boolean block:
  var short = true
  for each(s from l):
    when string-length(s) > 4:
      short := false
    end
  end
  short
end

#returns a list in reverse
fun reverse-list(l :: List) -> List block:
  var rev = [list:]
  for each(i from l):
    rev := L.push(rev, i)
  end
  rev
where:
  reverse-list([list: 1, 2, 3]) is [list: 3, 2, 1]
end

#concatinates all strings in list
fun concat-all(l :: List<String>) -> String block:
  var str = ""
  for each(s from l):
    str := str + s
  end
  str
where:
  concat-all([list:  "h", "e", "l", "l", "o"]) is "hello"
end
