=begin

Print all even numbers from 1 to 99, inclusive, to the console, with each number on a separate line.

-----------------------------------------------------------------------------------------------------------
Brute force algorithm:
Set counter to 1
loop until condition is false
  print if even
 increment loop

=end

value = 1
while value <= 99
  puts value if value.even?
  value += 1
end

#evens = (1..99).to_a.select { |num| num.even?}
#puts evens