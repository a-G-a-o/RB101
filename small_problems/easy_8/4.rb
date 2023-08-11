=begin

Write a method that returns a list of all substrings of a string that are palindromic. 
That is, each substring must consist of the same sequence of characters forwards as it does backwards. 
The return value should be arranged in the same sequence as the substrings appear in the string. 
Duplicate palindromes should be included multiple times.

You may (and should) use the substrings method you wrote in the previous exercise.

For the purposes of this exercise, you should consider all characters and pay attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. 
In addition, assume that single characters are not palindromes.

Examples:
palindromes('abcd') == []
palindromes('madam') == ['madam', 'ada']
palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

Further exploration:
Can you modify this method (and/or its predecessors) to ignore non-alphanumeric characters and case? Alphanumeric characters are alphabetic characters(upper and lowercase) and digits.

=end

def palindromes(string)
  new_arr = []
  arr_of_substrings = substrings(string)

  arr_of_substrings.each do |element|
    new_arr << element if palindrome?(element)
  end
  new_arr
end

def palindrome?(string)
  string.size > 1 && string == string.reverse
end

def substrings(string)
  new_arr = []

  0.upto(string.size - 1) do |count|
    count.upto(string.size - 1) do |index|
      new_arr << string[count..index]
    end
  end
  new_arr
end

#further exploration:--------------------------------------------------------------
def palindromes(string, alpha_sensitive=false)
  substrings(string).select do |word|
    if alpha_sensitive
      word = word.chars.select { |char| char.match? /\w/ }.join.downcase
    end
    word.size > 1 && word == word.reverse
  end
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

#further exploration---------------------------------------------------------------
p palindromes('hello-madam-did-madam-goodbye', true) == [
"ll", "-madam", "-madam-", "-madam-did-madam", "-madam-did-madam-", "madam", 
"madam-", "madam-did-madam", "madam-did-madam-", "ada", "adam-did-mada", 
"dam-did-mad", "am-did-ma", "m-did-m", "-did", "-did-", "did", "did-", 
"-madam", "-madam-", "madam", "madam-", "ada", "oo"
]

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]