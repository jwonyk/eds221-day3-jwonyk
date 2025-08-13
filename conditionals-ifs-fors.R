# Basic if statement

rm(list = ls())

burrito <- 1.5 # assigning on object value

# write a short if statement
if(burrito > 2) {
  
  print("I love burritos!")
  
}

# An exmaple with strings
my_ships <- c("Millenium Falcon", "X-wing", "Tie- Fighter", "Death Star")
stringr::str_detect(my_ships, pattern = "r")

phrase <- "I hate burritos!"

if(stringr::str_detect(phrase, "love")) {
  
  print("Big burrito fan")

}

# Basic if-else statement

pika <- 5 # storing a value to an object

if(pika > 60) { # define size of mega pikas
  print("Mega pika")
} else {# otherwise, print normal
  print("normal pika")
}

# Another exmaple with strings

food <- "I love tacos!"

if(stringr::str_detect(string = food, pattern = "burritos")) {

    print("yay burritos!")

} else {
  
  print("what about burritos?")
  
}

# More options with if-else statements

marmot <- 3.8

if(marmot < 0.5) { # defining small marmots
  
  print("small")
  
} else if(marmot >= 0.5 & marmot < 3) { # defining medium marmots
  
  print("medium")
  
} else { # defining large marmot
  
  print("large")
  
}

# Use the switch function to write complicated if else statements

species <- "mouse"

# all of this code is the same as several if else statements
switch (species,
  "cat" = print("meow"), # smae as writing an if statement
  "dog" = print("woof"), # same as else if statement
  "mouse" = print("squeak") # same as last else if statement
)

# see next week dplyr::case_when()!