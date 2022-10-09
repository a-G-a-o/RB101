#Write a method that takes one integer argument, which may be positive, negative, or zero. 
#This method returns true if the number's absolute value is odd. 
#You may assume that the argument is a valid integer value.

=begin
input: one integer, can be positive negative or zero
output: boolean
rules: cannot use #odd? or #even?

initalize method
  true if odd (num modulo 2 is remainder 1)
=end

def is_odd?(num)
  num % 2 == 1
end

=begin
alternative using #remainder()

def is_odd?(num)
  num.remainder(2) == 1 || num.remainder(2) == -1
  #num.remainder(2) != 0
end
=end

puts is_odd?(2)
puts is_odd?(5)
puts is_odd?(-17)
puts is_odd?(-8)
puts is_odd?(0)
puts is_odd?(7)