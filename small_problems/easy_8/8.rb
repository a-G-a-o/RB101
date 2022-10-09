=begin

Write a method that takes a string, and returns a new string in which every consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

Examples:
double_consonants('String') == "SSttrrinngg"
double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
double_consonants("July 4th") == "JJullyy 4tthh"
double_consonants('') == ""

=end

CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z)

def double_consonants(string)
  new_str = ''
  string.each_char do |char|
    new_str << char 
    new_str << char if CONSONANTS.include?(char.downcase)
  end
  new_str
end

#alternate solution:
CONSONANTS = ('a'..'z').to_a - %w(a e i o u)

def double_consonants(string)
  string.chars.map do |char|
    CONSONANTS.include?(char) ? char * 2 : char
  end.join
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""