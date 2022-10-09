=begin

Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.

Example output:
repeat('Hello', 3)
=>  Hello
    Hello
    Hello

=end
    
def repeat(str, num)
  num.times do
    puts str
  end
end

p repeat('Hello', 3)