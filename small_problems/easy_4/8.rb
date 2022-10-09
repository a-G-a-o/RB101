=begin

Write a method that takes a String of digits, and returns the appropriate number as an integer. 
The String may have a leading + or - sign; 
if the first character is a +, your method should return a positive number; 
if it is a -, your method should return a negative number. 
If no sign is given, you should return a positive number.

You may assume the string will always contain a valid number.

You may not use any of the standard conversion methods available in Ruby, such as String#to_i, Integer(), etc. 
You may, however, use the string_to_integer method from the previous lesson.

Example output:
string_to_signed_integer('4321') == 4321
string_to_signed_integer('-570') == -570
string_to_signed_integer('+100') == 100

Further exploration:
In our solution, we call string[1..-1] twice, and call string_to_integer three times. This is somewhat repetitive. 
Refactor our solution so it only makes these two calls once each.

=end

#string_to_integer method --------------------------------------------------------------------------------
DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }
  value = 0

  digits.each { |digit| value = 10 * value + digit }
  value
end

#original launch school solution --------------------------------------------------------------------------
def string_to_signed_integer(string)
  case string[0]
  when '-' then -string_to_integer(string[1..-1])
  when '+' then string_to_integer(string[1..-1])
  else          string_to_integer(string)
end

#Further exploration:
#refactor string_to_signed_integer() and eliminate repeating calls to method ------------------------------
def string_to_signed_integer(string)
  numbers = string_to_integer(string.delete('^a-z0-9'))
  string[0] == "-" ? -numbers : numbers
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100
