=begin
Build a program that asks a user for the length and width of a room in meters and then displays the area of the room in both square meters and square feet.
Note: 1 square meter == 10.7639 square feet

Enter the length of the room in meters:
10
Enter the width of the room in meters:
7
The area of the room is 70.0 square meters (753.47 square feet).

----------------------------------------------------------------------------------------
Input: Integers, converted to float
Output: String with square meters/feet float concatenation
Algorithm: Meter = length X width
           Square Feet = meter * 10.7639

=end

SQMETERS_TO_SQFEET = 10.7639

puts "Enter the length of the room in meters:"
length = gets.chomp.to_f

puts "Enter the width of the room in meters:"
width = gets.chomp.to_f

square_meter = (length * width).round(2)
square_feet = (square_meter * SQMETERS_TO_SQFEET).round(2)

puts "The area of the room is #{square_meter} square meters (#{square_feet} square feet)."