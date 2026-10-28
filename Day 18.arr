use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
include csv

# Intro

data BookRecord:
  | book(title :: String, author :: String, pages :: Number)
end

the-dispossessed = book("The Dispossessed", "Ursula K. Le Guin", 387)
to-the-lighthouse = book("To the Lighthouse", "Virginia Woolf", 209)
brave-new-world = book("Brave New World", "Aldous Huxley", 268)
tonys-book = book("Harry Potter", "JK Rowling", 500)
the-dispossessed.pages # evaluates to 

# Class Exercise

# 1

fun summary(b :: BookRecord) -> String:
  
  b.title + " was written by " + b.author + " and has " + num-to-string(b.pages) + " pages."
  
end

fun is-long-book(b :: BookRecord) -> Boolean:
  
  b.pages > 350
  
end

# podcasts

data PodcastRecord:
  | podcast(title :: String, host :: String, episodes :: Number)
end

joe-rogan-experience = podcast("The Joe Rogan Experience", "Joe Rogan", 2568)

fun pod-summary(p :: PodcastRecord) -> String:
  
  p.title + " is a podcast hosted by " + p.host + ". It has an episode count of " + num-to-string(p.episodes) + "!"
  
end

# recipes


recipes-raw = load-table:
  title :: String,
  servings :: String,
  prep-time :: String
  source: csv-table-url("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/support/5-recipes.csv", default-options)
end
recipes-with-servings = transform-column(recipes-raw, "servings", string-to-number-default(0))
recipes = transform-column(recipes-with-servings, "prep-time", string-to-number-default(0))

data RecipeRecord:
  | recipe(title :: String, servings :: Number, prep-time :: Number)
end
