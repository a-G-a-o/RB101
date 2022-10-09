=begin

Given a string that consists of some words (all lowercased) and an assortment of non-alphabetic characters, 
write a method that returns that string with all of the non-alphabetic characters replaced by spaces. 
If one or more non-alphabetic characters occur in a row, you should only have one space in the result (the result should never have consecutive spaces).

Examples:
cleanup("---what's my +*& line?") == ' what s my line '

=end

ALPHABET = ('a'..'z').to_a

def cleanup(string)
  chars = []

  string.chars.each do |char|
    if ALPHABET.include?(char)
      chars << char
    else
      chars << ' ' unless chars.last == ' '
    end
  end
  
  chars.join
end

#Alternative solution:--------------------------------------------
def cleanup(string)
  string.gsub(/[^a-z]+/, ' ')#.squeeze(' ')
end

p cleanup("---what's my +*& line?") == ' what s my line '