=begin

Write a method that takes a positive integer, n, as an argument, and displays a right triangle whose sides each have n stars. 
The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.

Examples:
triangle(5)
    *
   **
  ***
 ****
*****
triangle(9)
        *
       **
      ***
     ****
    *****
   ******
  *******
 ********
*********

Further exploration: 
Try modifying your solution so it prints the triangle upside down from its current orientation. 
Try modifying your solution again so that you can display the triangle with the right angle at any corner of the grid.

=end

def triangle(num)
  spaces = num - 1
  stars = 1

  num.times do |n|
    puts (' ' * spaces) + ('*' * stars)
    spaces -= 1
    stars += 1
  end
end

def top_right_triangle(num)
  spaces = 0
  stars = num

  num.times do |n|
    puts (' ' * spaces) + ('*' * stars)
    spaces += 1
    stars -= 1
  end
end

def bottom_left_triangle(num)
  spaces = num - 1
  stars = 1

  num.times do |n|
    puts ('*' * stars) + (' ' * spaces)
    spaces -= 1
    stars += 1
  end
end

def top_left_triangle(num)
  spaces = 0
  stars = num

  num.times do |n|
    puts ('*' * stars) + (' ' * spaces)
    spaces += 1
    stars -= 1
  end
end