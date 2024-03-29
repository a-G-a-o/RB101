=begin

Write a method that returns an Array that contains every other element of an Array that is passed in as an argument. 
The values in the returned list should be those values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.

Examples:
oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
oddities(['abc', 'def']) == ['abc']
oddities([123]) == [123]
oddities([]) == []

input: array
output: array with every other element
algorithm:  loop through array
            save first element to new array
            increment += 2
            break if index is greater than array size

=end

def oddities(arr)
  index = 0
  new_arr = []

  while index < arr.size
    new_arr << arr[index]
    index += 2
  end
  new_arr
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []

=begin
Alternative solutions:

def oddities(arr)
  (0...arr.size).step(2).map { |i| arr[i] }
end

def oddities(arr)
  new_arr = []

  arr.each_index { |i| new_arr << arr[i] if i.even? }
  new_arr
end

def eveneties(arr)
  arr.select.with_index { |_, idx| idx.odd? }
end

=end