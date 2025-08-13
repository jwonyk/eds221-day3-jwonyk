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

# Writing for loops

dog_names <- c("Teddy", "Khorna", "Banjo", "Waffle")

# create example for one data element to put into for loop
# version with copy / pasting

print(paste("My dog's name is", dog_names[1]))
print(paste("My dog's name is", dog_names[2]))
print(paste("My dog's name is", dog_names[3]))
print(paste("My dog's name is", dog_names[4]))

# version with a variable that I can update

pupster <- 1

print(paste("My dog's name is", dog_names[pupster]))

# convert to a for loop

for(pupster in dog_names) {
  
  print(paste("My dog's name is", pupster))
  
}

# Another for loop example
mass <- seq(from = 0, to = 3, by = 0.5)
i <- mass[1]
new_val <- i + 2 # adding 2 to each value
print(new_val) # print the new value

# write into a for loop
for (i in 1:length(mass)) { # defining iterator using the length of vector
  
  new_val <- i + 2 # adding 2 to each value
  print(new_val) # print the new value
  
}

# same thing!
for (i in seq_along(mass)) { # defining iterator using seq_along()
  
  new_val <- i + 2 # adding 2 to each value
  print(new_val) # print the new value
  
}

# another example with iterating by position (indexing)
tree_height <- c(1, 2, 6, 10)

# example for the first case
tree_height[1] + tree_height[2]

# convert into a generalizable expression
i <- 1
val <- tree_height[i] + tree_height[i + 1]
print(val)

# convert into a for loop
# test out creating the sequence

seq_along(tree_height)

for(i in seq_along(tree_height)) {
  
  val <- tree_height[i] + tree_height[i + 1]
  print(val)
  
}

animal <- c("cat", "dog", "dog", "zebra", "dog")

for(i in seq_along(animal)) {
  
  if(animal[i] == "dog") {
    
    print("I love dogs!")
    
  } else {
    
    print("These are other animals")
    
  }
  
}

# Another for loop example with conditional statements

# animal species
species <- c("dog", "elephant", "goat", "dog", "dog", "elephant")

# and their respective ages in human years
age_human <- c(3, 8, 4, 6, 12, 18)

# convert ages to "animal years" using the following:
# 1 human year = 7 in dog years
# 1 human year = 0.88 in elephant years
# 1 human year =  4.7 in goat years

# allocate space for our output
animal_age <- vector(mode = "numeric", length = length(species))

for(i in seq_along(species)) {
  
  if(species[i] == "dog") {
    
    animal_age <- age_human[i] * 7
    
  } else if(species[i] == "elephant") {
    
    animal_age <- age_human[i] * 0.88
    
  } else if(species[i] == "goat") {
    
    animal_age <- age_human[i] * 4.7
    
  }
  
  animal_age[i] <- animal_age # populate empty vector
  
}

# Another example of storing an output
tigers <- c(29, 34, 82)
lions <- c(2, 16, 6)

# allocate space for our output
big_cats <- vector(mode = "numeric", length = length(tigers))

for(i in seq_along(tigers)) {
  
  tocal_cats <- tigers[i] + lions[i]
  
}

# for loops to iterate across of data frame

# create vector to store values
mean_mtcars <- vector(mode = "numeric", length = ncol(mtcars))

for(i in 1:ncol(mtcars)) {
  
  mean_val <- mean(mtcars[[i]], na.rm = TRUE)
  mean_mtcars[i] <- mean_val
  
}

# A for loop over columns with a condition

library(palmerpenguins)

for(i in 1:ncol(penguins)) {
  
  if(is.numeric(penguins[[i]])) {
    
    penguin_median <- median(penguins[[i]], na.rm = TRUE)
    print(penguin_median)
    
  } else {
    
    print("data not numeric")
    
  }
  
}

# Functional programming

# apply() function iterates over columns or rows

# rewrite our for loop for finding mean values of the columns in mtcars
apply(X = mtcars, MARGIN = 2, FUN = mean)
# same as saying apply the function mean across the column in mtcars

library(tidyverse)

penguins %>%
  group_by(species) %>%
  summarise(across(where(is.numeric), mean, na.rm = TRUE))