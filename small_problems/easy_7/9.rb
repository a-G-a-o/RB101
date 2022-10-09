=begin

Write a method that takes two Array arguments in which each Array contains a list of numbers, 
and returns a new Array that contains the product of every pair of numbers that can be formed between the elements of the two Arrays. 
The results should be sorted by increasing value.

You may assume that neither argument is an empty Array.

Examples:
multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

=end

#Original solution:
def multiply_all_pairs(arr1, arr2)
  new_arr = []

  arr1.each do |element1|
    arr2.each do |element2|
      new_arr << element1 * element2
    end
  end
  new_arr.sort
end

#Compact solution:
def multiply_all_pairs(arr1, arr2)
  arr1.product(arr2).map { |num1, num2| num1 * num2 }.sort
end

#Using index incrementation:
def multiply_all_pairs(arr1, arr2)
  new_arr = []
  arr1.each do |num|
    index = 0
    while index <= arr2.size
      new_arr << num * arr2[index]
      index += 1
    end
  end
  new_arr.sort
end

#Using Enumerable#inject
def multiply_all_pairs(arr1, arr2)
  arr1.product(arr2).map { |sub_array| sub_array.inject(:*) }.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]