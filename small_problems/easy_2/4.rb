=begin

Build a program that displays when the user will retire and how many years she has to work till retirement.

Example:

What is your age? 30
At what age would you like to retire? 70

It's 2016. You will retire in 2056.
You have only 40 years of work to go!

----------------------------------------------------------------------------------------
Algorithm: desired retirement age - current age

=end

puts "What is your age?"
current_age = gets.to_i

puts "At what age would you like to retire?"
retirement_age = gets.to_i

years_remaining = retirement_age - current_age

current_year = Time.new.year

puts "It's #{year}. You will retire in #{year + years_remaining}."
puts "You have only #{years_remaining} years of work to go!"