use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

#SA1

fun check-age(a :: Number) -> Boolean:
  doc: "Chekcs if person is 21 or older"
  if a >= 21:
    true
  else:
    false
  end
where:
  check-age(19) is false
  check-age(25) is true
  check-age(21) is true
end

fun check-year(y :: Number) -> String:
  doc: "checks if year is past present or future"
  if y == 2026:
    "present"
  else if y > 2026:
    "future"
  else:
    "past"
  end
where:
  check-year(2028) is "future"
  check-year(2023) is "past"
  check-year(2026) is "present"
end


#SA2

fun find-scholars(t :: Table) -> Table:
  doc: "Returns table of students NOT in boston"
  fun is-scholar(r :: Row) -> Boolean:
    get-column(r, "campus") <> "Boston"
  end
  
  filter-with(t, is-scholar)
  
where:
  students = table: name, campus
      row: "Anthony", "Boston"
    row: "Kevin", "Oakland"
  end
  
  result = table: name, campus
    row: "Kevin", "Oakland"
  end
  
  find-scholars(students) is result
end


fun add-bad-year(t :: Table) -> Table:
  doc: "determines whether a year was profitable or not"
  
  fun is-bad(r :: Row) -> -> Boolean:
    get-column(r, "cost") < get-column(r, "revenue")
  end
  
  