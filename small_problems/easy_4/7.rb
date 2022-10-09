=begin

Write a method that takes a String of digits, and returns the appropriate number as an integer. 

Do not worry about leading + or - signs, nor should you worry about invalid characters; assume all characters will be numeric.
You may not use any of the standard conversion methods available in Ruby to convert a string to a number, such as String#to_i, Integer(), etc. 
Your method should do this the old-fashioned way and calculate the result by analyzing the characters in the string.

Example output:
string_to_integer('4321') == 4321
string_to_integer('570') == 570

Input: STRING
Output: INTEGER
Algorithm:  First, convert each String Number to it's equivalent integer using a HASH
                   parse through each character in the String and set to DIGITS[key] to get value
                   save in new digits variable (array of integers)
            
                   parse through digits, each digit is set to this formula:
                     set value = 0
                     result = 10 x value + current digit

value = 0
10 * 0 + 4 -> 4
10 * 4 + 3 -> 43
10 * 43 + 1 -> 431

=end

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

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570