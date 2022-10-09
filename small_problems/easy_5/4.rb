=begin

Given a string of words separated by spaces, write a method that takes this string of words and returns a string in which the first and last letters of every word are swapped.

You may assume that every word contains at least one letter, and that the string will always contain at least one word. 
You may also assume that each string contains nothing but words and spaces

Example output:
swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
swap('Abcde') == 'ebcdA'
swap('a') == 'a'

Further exploration:
How come our solution passes word into the swap_first_last_characters method invocation instead of just passing the characters that needed to be swapped? 
Suppose we had this implementation: Would this method work? Why or why not?

def swap_first_last_characters(a, b)
  a, b = b, a
end

swap_first_last_characters(word[0], word[-1])

=end

def swap(sentence)
  new_arr = sentence.split.map do |word|
    word[0], word[-1] = word[-1], word[0]
    word
  end
  
  new_arr.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'

#Further exploration: This would not work and results in word[0] and word[-1] in an array, not the entire word.