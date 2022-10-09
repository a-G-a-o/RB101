=begin

Write a method that returns a list of all substrings of a string that start at the beginning of the original string. 
The return value should be arranged in order from shortest to longest substring.

Examples:
leading_substrings('abc') == ['a', 'ab', 'abc']
leading_substrings('a') == ['a']
leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

=end

def leading_substrings(string)
  new_arr = []
  counter = 0
  while counter < string.size
    new_arr << string[0..counter]
    counter += 1
  end
  new_arr
end

#launch school solution:
def leading_substrings(string)
  new_arr = []
  0.upto(string.size - 1) do |index|
    new_arr << string[0..index]
  end
  new_arr
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']