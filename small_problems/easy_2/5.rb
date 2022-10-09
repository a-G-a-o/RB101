=begin

Write a program that will ask for user's name. The program will then greet the user. 
If the user writes "name!" then the computer yells back to the user.

What is your name? Bob
Hello Bob.

What is your name? Bob!
HELLO BOB. WHY ARE WE SCREAMING?

----------------------------------------------------------------------------------------
Input: String
Output: String with string concatenation

=end

puts "What is your name?"
name = gets.chomp   #can also change to .chomp!

if name[-1] == '!'
  name = name.chop  #can also change to .chomp!
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name.capitalize}."
end