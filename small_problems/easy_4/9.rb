=begin

Write a method that takes a positive integer or zero, and converts it to a string representation.

You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s String(), Kernel#format, etc. 
Your method should do this the old-fashioned way and construct the string by analyzing and manipulating the number.

Example output:
integer_to_string(4321) == '4321'
integer_to_string(0) == '0'
integer_to_string(5000) == '5000'

Input: integer
Output: string equivalent
Algorithm:  create array of strings (this works because each index number equals string value)
            initialize new string
            loop
              divide number by 10 to get remainder
              append remainder to new string
              return new string

=end

DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(num)
  new_str = ''

  loop do
    num, remainder = num.divmod(10)
    new_str.prepend(DIGITS[remainder])
    break if num == 0
  end

  p new_str
end

#idiomatic solution:
def integer_to_string(integer)
  integer.digits.join.reverse
end

def integer_to_string(integer)
  new_array = []
  new_array << integer 
  new_array.join
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'