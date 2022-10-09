=begin

Write a method that takes a single String argument and returns a new string that contains 
the original value of the argument with the first character of every word capitalized and all other letters lowercase.

You may assume that words are any sequence of non-blank characters.

Examples:
word_cap('four score and seven') == 'Four Score And Seven'
word_cap('the javaScript language') == 'The Javascript Language'
word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

=end

#original solution
def word_cap(str)
  words = str.split.map { |word| word.capitalize }
  words.join(' ')
end

#idiomatic solution:
def word_cap(str)
  str.split.map(&:capitalize).join(' ')
end

#further exploration: solution not using #capitalize
def word_cap(str)
  str.split.map do |word|
    word = word.downcase
    word[0] = word.[0].upcase
    word
  end.join(' ')
end

def word_cap(str)
  str.split.map { |word| word[0].upcase + word[1..-1].downcase }.join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'