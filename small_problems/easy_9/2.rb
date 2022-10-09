=begin

A double number is a number with an even number of digits whose left-side digits are exactly the same as its right-side digits. 
For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433, and 107 are not.

Write a method that returns 2 times the number provided as an argument, unless the argument is a double number; double numbers should be returned as-is.

Examples:
twice(37) == 74
twice(44) == 44
twice(334433) == 668866
twice(444) == 888
twice(107) == 214
twice(103103) == 103103
twice(3333) == 3333
twice(7676) == 7676
twice(123_456_789_123_456_789) == 123_456_789_123_456_789
twice(5) == 10

=end

#my solution
def twice(number)
  num_string = number.to_s
  middle = (num_string.size / 2) - 1
  first_half = num_string[0..middle]
  second_half = num_string[(middle + 1)..num_string.size]

  return number if first_half == second_half
  return number * 2

  #if num_string.size.odd?
  #  number * 2
  #elsif first_half == second_half
  #  number
  #else
  #  number * 2
  #end
end

#launch school solution
def twice(number)
  num_string = number.to_s
  middle = num_string.size / 2
  first_half = middle.zero? ? '' : num_string[0..middle - 1]
  second_half = num_string[middle..-1]

  return number if first_half == second_half
  return number * 2
end

#alternate solution:
def twice(number)
  num_string = number.to_s
  middle = num_string.size / 2
  num_string[0, middle] == num_string[middle..-1] ?
    number :
    number * 2
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10