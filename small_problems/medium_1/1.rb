require 'pry'
=begin

Write a method that rotates an array by moving the first element to the end of the array. 
The original array should not be modified.

Do not use the method Array#rotate or Array#rotate! for your implementation.

Example:
rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true

INPUT: an array
OUTPUT: a new array
EXPL EXP: rotates the first index number and moves it to the end
          original array should not be modified
          cannot use rotate or rotate!
IMPL EXP: can be any object class

ALGORITHM:  START
            initalize new array
            loop through each index of array
            skip index 0
            add each index after 0 to length - 1
            if index == length then << arr[0]
            return new array
            END

Further Exploration:
Write a method that rotates a string instead of an array. 
Do the same thing for integers. 
You may use rotate_array from inside your new method.

=end

# my solution
def rotate_array(arr)
  new_arr = []

  arr[1..arr.length].each do |element|
    new_arr << element
  end
  new_arr << arr[0]
end

#ls solution
def rotate_array(arr)
  arr[1..-1] + arr[0]
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true

#further exploration:
def rotate_string(str)
  str[1..-1] + str[0]
end

str = 'anita gao'
puts rotate_string(str)

def rotate_integer(int)
  rotate_string(int.to_s).to_i
end

int = 123456
p rotate_integer(int)
