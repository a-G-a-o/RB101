=begin

Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.

You may assume that both input Arrays are non-empty, and that they have the same number of elements.

Example:
interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

=end

def interleave(arr1, arr2)
  new_arr = []
  arr1.each_with_index do |element, index|
    new_arr << element << arr2[index]
  end
  new_arr
end

#further exploration using Array#zip
def interleave(arr1, arr2)
  result = arr1.zip(arr2).flatten
  result
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']