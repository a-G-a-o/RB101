=begin

Write a method that takes an integer, and converts it to a string representation.

You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. 
You may, however, use integer_to_string from the previous exercise.

Example output:
signed_integer_to_string(4321) == '+4321'
signed_integer_to_string(-123) == '-123'
signed_integer_to_string(0) == '0'

Further exploration:
Refactor our solution to reduce the 3 integer_to_stringcalls to just one.

=end

def signed_integer_to_string(number)
  case number <=> 0
  when -1 then "-#{(integer_to_string(-number))}"
  when +1 then "+#{integer_to_string(number)}"
  else         integer_to_string(number)
  end
end

#further exploration:
def signed_integer_to_string(number)
  return '0' if number == 0

  unsigned_num = integer_to_string(number.abs)
  number < 0 ? unsigned_num.prepend('-') : unsigned_num.prepend('+')
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'