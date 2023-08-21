=begin

Problem: Write a method that takes ONE argument, a positive integer,
          returns a string of alternating 1s and 0s,
          always starting with 1.
          The length of the string should match the given integer.

E:  puts stringy(6) == '101010'
    puts stringy(9) == '101010101'
    puts stringy(4) == '1010'
    puts stringy(7) == '1010101'

D Input: one positive integer
  Output: string
  Rules:  
    explicit: alternating 1s and 0s, 
          always starts with 1
          length of string should match given integer
    implicit: should return a new string

ALGORITHM---------
START
initalize str variable to empty string
GET integer and SET integer to times method block
  IF str is empty OR ends in '0' THEN add '1' to end of str
  IF string ends with '1' THEN add '0' to end of str

return str
END----------------

#=end

def stringy(num)
  str = ''
  num.times do
    if str.empty? || str.end_with?('0')
      str.concat('1')
    elsif str.end_with?('1')
      str.concat('0')
    end
  end
  str
end

def stringy(size)
  numbers = []

  size.times do |index|
    number = index.even? 1 : 0
    numbers << number
  end
  numbers.join
end

=begin

FURTHER EXPLORATION:
Modify stringy so it takes an additional optional argument that defaults to 1. 
If the method is called with this argument set to 0, 
the method should return a String of alternating 0s and 1s, but starting with 0 instead of 1.

=end

def stringy(size, switch = 1)
  numbers = []

  size.times do |index|
    number = index.even? ? 1 : 0 if switch == 1
    number = index.even? ? 0 : 1 if switch == 0
    numbers << number
  end
  numbers.join
end

puts stringy(6, 0) #== '101010'
puts stringy(9, 0) #== '101010101'
puts stringy(4, 0) #== '1010'
puts stringy(7, 0) #== '1010101'