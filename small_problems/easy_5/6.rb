=begin

Write a method that takes a string with one or more space separated words and returns a hash that shows the number of words of different sizes.
(Words consist of any string of characters that do not include a space.)

Examples:
word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
word_sizes('') == {}

=end

def word_sizes(phrase)
  count_hash = Hash.new(0)   
  phrase.split.each do |word|
    count_hash[word.size] += 1
    # You don't need to check if the key exists, counts[word.size] will automatically do it
    #
    # My solution:
    #   hash[word.size] += 1 if hash.has_key?(word.size)
    #   hash[word.size] = 1
  end

  count_hash
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}