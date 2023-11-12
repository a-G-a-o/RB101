require 'pry'
=begin

Write a method that can rotate the last n digits of a number. 

For example:
rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917

Note that rotating just 1 digit results in the original number being returned.
You may use the rotate_array method from the previous exercise if you want. (Recommended!)
You may assume that n is always a positive integer.

INPUT: integer digits, integer to represent which digit to rotate
OUTPUT: rotated integer digits
EXPL EXP: rotate just 1 digit in the original number
          always a positive integer
IMPL EXP: returning a new integer?

ALGORITHM:  START
            GET integer arg, GET position arg
            convert integer to string then split to chars
            select [position to end of array] and use rotate_array
            lastly, join and convert back to integer
            END
=end

#my solution
def rotate_rightmost_digits(digits, position)
  str = digits.to_s
  index = str.length - position

  new_digits = str.delete str[index]
  (new_digits + str[index]).to_i
end

#ls solution
def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  #ie: (735291, 3) would only rotate [-3..-1] which is "291" -> "912"
  all_digits.join.to_i
end

def rotate_array(arr)
  arr[1..-1] + arr[0]
end

p rotate_rightmost_digits(735291, 1) #== 735291
p rotate_rightmost_digits(735291, 2) #== 735219
p rotate_rightmost_digits(735291, 3) #== 735912
p rotate_rightmost_digits(735291, 4) #== 732915
p rotate_rightmost_digits(735291, 5) #== 752913
p rotate_rightmost_digits(735291, 6) #== 352917