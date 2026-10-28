use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

fun winner(home :: Number, away :: Number) -> String:
  doc: "returns winner or tie based on score"
  
  if home > away:
    "home"
  else if away > home:
    "away"
  else:
    "tie"
  end
  
where:
  winner(10, 9) is "home"
  winner(9, 10) is "away" 
  winner(10, 10) is "tie"
end
# problem 2


fun score-text(n :: Number) -> String:
  doc: "returns the score as a string"
  
  num-to-string(n)
  
where:
  score-text(1) is "1"
  score-text(100) is "100"
end
  
#problem 3

fun team-square(is-winner :: Boolean, score :: Number) -> Image:
  doc: "shows team's score and decides if they are winning"
  color = if is-winner: "gold" else: "grey" end
  rect = rectangle(100, 50, "solid", color)
  
  
  
  final = text(score-text(score), 24, "black")
  
  overlay(final, rect)
end

# problem 4

fun scoreboard(h :: Number, a :: Number) -> Image:
  doc: "displays scoreboard and winner-case"
  beside(team-square(h > a, h), team-square(a > h, a))
end

# problem 5

fun final-scoreboard(h :: Number, a :: Number, is-final :: Boolean) -> Image:
  doc: "displays scoreboard and determines if it is the final score"
  
  final = text("FINAL", 24, "white")
  
  if is-final:
    above(final, scoreboard(h, a))
  else:
    scoreboard(h, a)
  end
end
    

    