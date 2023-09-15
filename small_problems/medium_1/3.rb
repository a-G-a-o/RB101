require 'pry'
=begin
If you take a number like 735291, and rotate it to the left, you get 352917. 
If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175. 
Keep the first 2 digits fixed in place and rotate again to 321759. 
Keep the first 3 digits fixed in place and rotate again to get 321597. 
Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579. 
The resulting number is called the maximum rotation of the original number.

Write a method that takes an integer as argument, and returns the maximum rotation of that argument. 
You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.

Note that you do not have to handle multiple 0s.

Example:
max_rotation(735291) == 321579
max_rotation(3) == 3
max_rotation(35) == 53
max_rotation(105) == 15 # the leading zero gets dropped
max_rotation(8_703_529_146) == 7_321_609_845

INPUT: integer
OUTPUT: integer
EXPL EXP: rotates each number in digit length
          can use previous method rotate_rightmost_digits
IMPL EXP: returns a new integer?

ALGORITHM:  convert number to string, get size and save in new variable
            starting from size downto(2), 
              pass in num to rotate_rightmost_digit method
                rotates num from [-6] to [-2]
                ie: 735291
                  -[654321]
            return number

=end

# def max_rotation(number)
#   number_digits = number.to_s.size
#   number_digits.downto(2) do |n|
#     number = rotate_rightmost_digits(number, n)
#   end
#   number
# end

# def rotate_rightmost_digits(digits, n)
#   digits[-n..-1] = rotate_array(digits[-n..-1])
#   digits
# end

# def rotate_array(arr)
#   arr[1..-1] + arr[0]
# end

=begin
FURTHER EXPLORATION:
Assume you do not have the rotate_rightmost_digits or rotate_array methods. 
How would you approach this problem? Would your solution look different? 
Does this 3 part approach make the problem easier to understand or harder?

There is an edge case in our problem when the number passed in as the argument has multiple consecutive zeros. 
Can you create a solution that preserves zeros?
=end

def max_rotation(number)
  str = number.to_s
  number_digits = str.size

  number_digits.downto(2) do |n|
    str[-n..-1] = str[(-n + 1)..-1] + str[-n]
  end
  
  if str.start_with?('0')
    printf("%0#{number_digits}d", str.to_i)
  else
    str.to_i
  end
end

puts max_rotation(735291) #== 321579
puts max_rotation(3) #== 3
puts max_rotation(35) #== 53
puts max_rotation(105) #== 15 # the leading zero gets dropped
puts max_rotation(8_703_529_146) #== 7_321_609_845
