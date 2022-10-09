=begin

Write a method that returns the next to last word in the String passed to it as an argument.
Words are any sequence of non-blank characters.
You may assume that the input String will always contain at least two words.

Examples:
penultimate('last word') == 'last'
penultimate('Launch School is great!') == 'is'

Further exploration:
Suppose we need a method that retrieves the middle word of a phrase/sentence. 
What edge cases need to be considered? 
How would you handle those edge cases without ignoring them? 

Write a method that returns the middle word of a phrase or sentence. It should handle all of the edge cases you thought of.

=end

def penultimate(string)
  arr = string.split
  arr[arr.length - 2]

  #arr[-2]
  #string.split(' ')[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

=begin
Further exploration:
  Edge cases:
    - what if the argument is empty?
    - what if the argument only has one word?
    - what if the argument doesn't have a middle word? (ie: even amount of words)
=end

def get_middle_word(string)
  return string if string.empty? || string.split.size == 1

  arr = string.split
  middle = (arr.size - 1) / 2 
  
  arr.size.even? ? arr[middle] : arr[middle + 1]
end