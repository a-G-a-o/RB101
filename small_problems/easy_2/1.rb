=begin
Build a program that randomly generates and prints Teddy's age. 
To get the age, you should generate a random number between 20 and 200.

Input: String name
Output: String with age integer string concatenation
Rules: age must be a random number between 20 and 200
=end

puts "Enter a name and I will tell you how old they are:"
name = gets.chomp
name = "Teddy" if name.empty?

age = rand(20..200)
puts "#{name} is #{age} years old!"
