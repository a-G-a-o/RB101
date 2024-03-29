=begin

In the modern era under the Gregorian Calendar, leap years occur in every year that is evenly divisible by 4, unless the year is also divisible by 100. 
If the year is evenly divisible by 100, then it is not a leap year unless the year is evenly divisible by 400. 
Assume this rule is good for any year greater than year 0. 

Write a method that takes any year greater than 0 as input, and returns true if the year is a leap year, or false if it is not a leap year.

Further exploration:
Rewrite leap_year? to perform its tests in the opposite order of the above solution. 
Test whether the year is divisible by 4 first, then, if necessary, test whether it is divisible by 100, and finally, if necessary, test whether it is divisible by 400. 
Is this solution simpler or more complex than the original solution?

Example output:
leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == false
leap_year?(1) == false
leap_year?(100) == false
leap_year?(400) == true

=end

def leap_year?(year)
  if year % 400 == 0 
    true
  elsif year % 100 == 0
    false
  else
    year % 4 == 0
  end
end

#alternate solution:
def leap_year?(year)
  (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
end

#further exploration:--------------------------------------------------------------
def leap_year?(year)
  if year % 4 == 0 
    if year % 100 == 0
      return false if year % 400 != 0
      true
    end
    true
  else
    false
  end
end

#Further exploration: alternate solution--------------------------------------------
def leap_year?(year)
  if year % 4 == 0 && !(year % 100 == 0)
    true
  else
    year % 400 == 0
  end
end

=begin
By simply reversing the order to evaluate from 400, 100, 4, to 4, 100, 400, years 2100, 100, 1700, and 1900 would not produce the correct result. 
It would only work if 100 and 400 were nested within the initial if/else.
=end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true
