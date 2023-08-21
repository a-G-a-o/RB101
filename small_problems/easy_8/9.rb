=begin

Write a method that takes one argument, a string containing one or more words, 
and returns the given string with words that contain five or more characters reversed. 
Each string will consist of only letters and spaces. 
Spaces should be included only when more than one word is present.

Examples:   puts reverse_words('Professional')          # => lanoisseforP
            puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
            puts reverse_words('Launch School')         # => hcnuaL loohcS

INPUT: string containing one or more words
OUTPUT: new string
Explicit exp: words containing five or more characters are reversed
              strings will only have letters and spaces
              spaces included only when string has more than one word
Implicit exp: case sensitive

Algorithm:  START
            GET string argument, split
            loop through string
              select word >5 and reverse
            join(' ')
            END

=end

def reverse_words(str)
  words = []

  str.split.each do |word|
    word.reverse! if word.length >= 5
    words << word
  end
  
  words.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS