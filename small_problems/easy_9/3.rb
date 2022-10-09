=begin

Write a method that takes a number as an argument. If the argument is a positive number, return the negative of that number. 
If the number is 0 or negative, return the original number.

Examples:
negative(5) == -5
negative(-3) == -3
negative(0) == 0      # There's no such thing as -0 in ruby

Further exploration:
Which solution is better?

=end

#my solution:
def negative(number)
  return number * -1 if number * 1 > 0
  number
end

#launch school solution:
def negative(number)
  number > 0 ? -number : number
end

#further exploration:
def negative(number)
  -number.abs
end
#This method is written shorter but it goes through the complicated steps of stripping number of its sign, even if number
#is already negative to begin with. Then the negative is added back. Solution 1 is much more logically straightfoward.

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby