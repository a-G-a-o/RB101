#Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

=begin
input: one argument, positive integer
output: array
rules: return is an array of each digit in the number, separated


initalize method named digit_list()
set argument to number
initialize empty array
  loop
    use divmod to separate number from last digit
    set variable1 to the 1st part and variable2 to second part of number.divmod
    add variable2 to front of array
    set break clause
  return array
=end


def digit_list(number)
  digits = []
  loop do
    number, remainder = number.divmod(10)
    digits.unshift(remainder)
    break if number == 0
  end
  digits
end


puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true