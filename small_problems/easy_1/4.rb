=begin

Write a method that takes two arguments, a positive integer and a boolean, and calculates the bonus for a given salary.
If the boolean is true, the bonus should be half of the salary. 
If the boolean is false, the bonus should be 0.

Examples:
puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000

Input: 2 arg - a positive integer and a boolean
Output: integer
Implicit exp: return new integer
Explicit exp: if boolean is true, bonus should be half the salary
              if boolean is false, bonus should be 0

Algorithm:  START
            return 0 if !boolean
            elsif boolean, new_int = integer / 2
              return new_int
=end

def calculate_bonus(salary, bonus)
  #if !bool 
  #  return 0
  #else
  #  half = salary / 2
  #  return half
  #end
  
  bonus ? salary / 2 : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000