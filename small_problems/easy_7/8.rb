=begin

Write a method that takes two Array arguments in which each Array contains a list of numbers, 
and returns a new Array that contains the product of each pair of numbers from the arguments that have the same index. 
You may assume that the arguments contain the same number of elements.

Examples:
multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

Further exploration:
Come up with a one line solution using Array#zip method (not counting the def and end lines).

=end

def multiply_list(arr1, arr2)
  arr3 = []
  arr1.each_index { |index| arr3 << arr1[index] * arr2[index] }
  arr3
end

#launch school solution:
def multiply_list(list_1, list_2)
  products = []
  list_1.each_with_index do |item, index|
    products << item * list_2[index]
  end
  products
end

#further exploration:
def multiply_list(arr1, arr2)
  arr1.zip(arr2).map { |(a, b)| a*b }
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]