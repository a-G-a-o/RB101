=begin

Write a method that takes one argument, a string, and returns a new string with the words in reverse order.

Examples:
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''

INPUT: string
OUTPUT: a new string
EXPLICIT EXP: arrange the words in the argument string in reverse order
IMPLICIT EXP: empty string or spaces returns empty string
              case sensitive

Algorithm:  START
            SET edge condition to check if sentence is empty or all spaces
                return '' if true
            ELSE GET string argument and use split -> array
                reverse array
            SET new string and SET to array.join(' ')
            END

=end

def reverse_sentence(str)
  return '' if str.empty? || str.strip.empty?

  reversed_str = str.split(' ').reverse.join(' ')
  reversed_str
end

#more refined solution
def reverse_sentence(str)
  str.split.reverse.join(' ')
end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''