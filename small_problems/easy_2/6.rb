=begin
Print all odd numbers from 1 to 99, inclusive, to the console, with each number on a separate line.

Output: Odd numbers up to 99
Algorithm: loop through numbers
           print if number is odd

=end

odd_num = (1..99).to_a.select { |num| num.odd? }
puts odd_num

#Alternate solutions:
for num in 1..99
  puts num if num.odd?
end

value = 1
while value <= 99
  puts value
  value += 2
end

(1..99).each { |number| puts number if number.odd?}

puts (1..99).select(&:odd?)
