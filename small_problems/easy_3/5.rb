=begin

Using the multiply method from the "Multiplying Two Numbers" problem, 
write a method that computes the square of its argument (the square is the result of multiplying a number by itself).

Example:

square(5) == 25
square(-8) == 64

input: integer, can be positive or negative
output: integer
algorithm: num * num

save multiply(num, num) to variable

loop until n
  save variable to new multiply(variable, num)
return variable

=end

def multiply(num1, num2)
  num1 * num2
end

def square(num)
  multiply(num, num)
end

#---------------------------------------------------------

def power_to_the_n(num, n)
  exponent = num

  (n-1).times do
    num = multiply(num, exponent)
  end

  num
end

#----------------------------------------------------------

#p square(5)
#p square(-8)

p power_to_the_n(5, 3)