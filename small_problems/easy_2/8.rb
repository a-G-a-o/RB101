=begin

Write a program that asks the user to enter an integer greater than 0, 
then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.

Examples:---------------------------------------------------------
>> Please enter an integer greater than 0:
5
>> Enter 's' to compute the sum, 'p' to compute the product.
s
The sum of the integers between 1 and 5 is 15.

>> Please enter an integer greater than 0:
6
>> Enter 's' to compute the sum, 'p' to compute the product.
p
The product of the integers between 1 and 6 is 720.
----------------------------------------------------------------------------------------
Input: Integer, character selection
Output: String with integer concatenation
Algorithm: sum method
           set sum variable
           range 1 to num
           loop
             add each number to sum
             return sum

          product method
            set product variable
            range 1 to num
            loop
              num * product
            return product

=end

def compute_sum(number)
  total = 0
  1.upto(number) { |value| total += value }
  total
end

def compute_product(number)
  total = 1
  1.upto(number) { |value| total *= value }
  total
end

puts ">> Please enter an integer greater than 0"
number = gets.chomp.to_i

puts ">> Enter 's' to compute the sum, 'p' to compute the product."
operation = gets.chomp

if operation == 's'
  sum = compute_sum(number)
  puts "The sum of the integers between 1 and #{number} is #{sum}."
elsif operation == 'p'
  product = compute_product(number)
  puts "The product of the integers between 1 and #{number} is #{product}."
else
  puts "Oops. Unknown operation."
end

#My solution:
puts ">> Please enter an integer greater than 0:"
number = gets.chomp.to_i

puts ">> Enter 's' to compute the sum, 'p' to compute the product."
answer = gets.chomp

total = 0

if answer == 's'
  (1..number).each { |num| total += num }
  puts "The sum of the integers between 1 and #{number} is #{total}."
elsif answer == 'p'
  total += 1
  (1..number).each { |num| total *= num}
  puts "The product of the integers between 1 and #{number} is #{total}."
else
  puts "Unknown operation."
end

#Alternative synax:
sum = (1..int).inject(:+)
product = (1..int).inject(:*)
