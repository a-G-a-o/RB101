=begin

Write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.

==> Enter the 1st number:
25
==> Enter the 2nd number:
15
==> Enter the 3rd number:
20
==> Enter the 4th number:
17
==> Enter the 5th number:
23
==> Enter the last number:
17
The number 17 appears in [25, 15, 20, 17, 23].

==> Enter the 1st number:
25
==> Enter the 2nd number:
15
==> Enter the 3rd number:
20
==> Enter the 4th number:
17
==> Enter the 5th number:
23
==> Enter the last number:
18
The number 18 does not appear in [25, 15, 20, 17, 23].

Input: integers, save into array
Output: string
Algorithm:set output array as [1st, 2nd, 3rd, 4th, 5th]
          set counter
          loop
            puts message + output array[counter]
            get input
            save input in another array
          if last number is in array 
            print phrase
          else
            print another phrase

=end

counter_array = %w(1st 2nd 3rd 4th 5th last)
new_array = []

counter_array.each do |position|
  puts "==> Enter the #{position} number:"
  new_array << gets.chomp.to_i
end

last_num = counter.array.pop

if new_array.include?(last_num)
  puts "The number #{last_num} appears in #{new_array}."
else
  puts "The number #{last_num} does not appear in #{new_array}."
end

=begin
counter_array = %w(1st 2nd 3rd 4th 5th last)
new_array = []
index = 0
last_num = 0

while index < counter_array.size
  puts "==> Enter the #{counter_array[index]} number:"
  number = gets.chomp.to_i
  
  if index == counter_array.size - 1
    last_num = number
    break
  end

  new_array << number
  index += 1
end

if new_array.include?(last_num)
  puts "The number #{last_num} appears in #{new_array}."
else
  puts "The number #{last_num} does not appear in #{new_array}."
end
=end