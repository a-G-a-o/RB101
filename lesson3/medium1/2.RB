puts "the value of 40 + 2 is " + (40 + 2).to_s

#this throws a TypeError error as (40 + 2) is an integer and cannot be converted into a string
#Solution: add .to_s to (40 + 2) to turn it into a string OR string interpolation #{40 + 2}