=begin

Write a method that returns a list of all substrings of a string. 
The returned list should be ordered by where in the string the substring begins. 
This means that all substrings that start at position 0 should come first, then all substrings that start at position 1, and so on. 
Since multiple substrings will occur at each position, the substrings at a given position should be returned in order from shortest to longest.

You may (and should) use the leading_substrings method you wrote in the previous exercise:

Examples:
substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

=end

#my solution
def substrings(string)
  new_arr = []

  0.upto(string.size - 1) do |count|
    count.upto(string.size - 1) do |index|
      new_arr << string[count..index]
    end
  end
  new_arr
end

#Solution using leading_substrings():
def leading_substrings(string)
  new_arr = []

  0.upto(string.size - 1) do |index|
    new_arr << string[0..index]
  end
  new_arr
end

def substrings(string)
  new_arr = []
  (0..string.size).each do |index|
    substring = string[index..-1]
    new_arr.concat(leading_substrings(substring))
  end
  new_arr
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]