=begin

Write a method that takes an Array as an argument, and returns two Arrays (as a pair of nested Arrays) that contain the first half and second half of the original Array, respectively. 
If the original array contains an odd number of elements, the middle element should be placed in the first half Array.

Examples:
halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
halvsies([5]) == [[5], []]
halvsies([]) == [[], []]

Further exploration:
Can you explain why our solution divides array.size by 2.0 instead of just 2?

=end

def halvsies(array)
  half = (array.size / 2.0).ceil

  first_half = array.slice(0, half)
  second_half = array.slice(half, array.size - half)

  [first_half, second_half]
end

=begin
FURTHER EXPLORATION: using other solutions...

def halvsies(arr)
  arr.partition.with_index do |_, idx|
    idx < (arr.length / 2.0).ceil
  end
end

def halvsies(array)
  array.size.odd? ? middle = array.size / 2 + 1 : middle = array.size / 2

  [array[0...middle]] + [array[middle..-1]]
end

=end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]