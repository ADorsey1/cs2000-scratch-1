use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
# Intro
data NumList:
  | nl-empty
  | nl-link(first :: Number, rest :: NumList)
end

emp = nl-empty
nl1 = nl-link(3, nl-empty)
nl2 = nl-link(7, nl-link(3, nl-empty))
nl3 = nl-link(2, nl-link(7, nl-link(3, nl-empty)))

fun num-7s(nl :: NumList) -> Number:
  cases (NumList) nl:
    | nl-empty => 0
    | nl-link(first, rest) =>
      if first == 7:
        num-7s(rest) + 1
      else:
        num-7s(rest)
      end
  end
where:
  num-7s(nl-empty) is 0
  num-7s(nl-link(0, nl-empty)) is 0
  num-7s(nl-link(7, nl-empty)) is 1
  num-7s(nl-link(0, nl-link(7, nl-empty))) is 1
  num-7s(nl-link(0, nl-link(7, nl-link(7, nl-empty)))) is 2
end

#1. 

fun contains-n(nl :: NumList, n :: Number) -> Boolean:
  "whether n is in nl"
  cases (NumList) nl:
    | nl-empty => false
    | nl-link(first, rest) =>
      if first == n:
        true
      else: 
        contains-n(rest, n)
      end
  end
      
where:
      contains-n(nl-empty, 7) is false
      contains-n(nl-link(0, nl-empty), 7) is false
      contains-n(nl-link(7, nl-empty), 7) is true
      contains-n(nl-link(0, nl-link(7, nl-empty)), 7) is true
      contains-n(nl-link(0, nl-link(7, nl-link(7, nl-empty))), 7) is true
end

#2.

fun total-sum(nl :: NumList) -> Number:
  cases (NumList) nl:
      "returns the sum of numbers in a NumList"
    | nl-empty => 0
    | nl-link(first, rest) =>
      first + total-sum(rest)
  end
  
where:
  total-sum(nl-empty) is 0
  total-sum(nl-link(3, nl-empty)) is 3
  total-sum(nl-link(5, nl-link(3, nl-empty))) is 8
end

#3. 

fun remove-3s(nl :: NumList) -> NumList:
  cases (NumList) nl:
      doc: "returns numlist without 3's"
    | nl-empty => nl-empty
    | nl-link(first, rest) =>
      if first == 3:
        remove-3s(rest)
      else:
        nl-link(first, remove-3s(rest))
      end
  end
 
where:
  remove-3s(nl-empty) is nl-empty
  remove-3s(nl-link(5, nl-link(3, nl-link(0, nl-empty)))) is nl-link(5, nl-link(0, nl-empty))
  
end

#4. 

data NumListList:
  | nll-empty
  | nll-link(first :: NumList, rest :: NumListList)
end

nll1 = nll-link(nl3, nll-link(nl2, nll-empty))

fun total-sum-of-lists(nll :: NumListList) -> NumList:
  doc: "numlist of sums of sublists of list of numlists"
  cases (NumListList) nll:
    | nll-empty => nl-empty
    | nll-link(first, rest) =>
      nl-link(total-sum(first), total-sum-of-lists(rest))

  end
where:
  total-sum-of-lists(nll1) is nl-link(12, nl-link(10, nl-empty))
end

#5. 

data StrList:
  | sl-empty
  | sl-link(first :: String, rest :: StrList)
end