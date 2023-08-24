=begin

Write a method that takes one argument, a positive integer, and returns the sum of its digits.
For a challenge, try writing this without any basic looping constructs (while, until, loop, and each).

Examples:
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

INPUT: a positive integer
OUTPUT: integer
EXPL EXP: the return is a sum of all parameter digits
          cannot use looping constructs
IMPL EXP: 

ALGORITHM:  START
            GET integer argument, SET arr variable
            convert integer to string then #split to individual digits of strings
            #map array of strings to array of integers
            #sum array of integers
            END

=end

def sum(int)
  int_to_arr = int.to_s.split('') # can also use #chars
  sum = int_to_arr.map(&:to_i).sum
  sum
end

#ls solution
def sum(int)
  int.to_s.chars.map(&:to_i).reduce(:+)
end

puts sum(23) #== 5
puts sum(496) #== 19
puts sum(123_456_789) #== 45
