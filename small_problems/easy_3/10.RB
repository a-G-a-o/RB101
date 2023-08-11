=begin

Write a method that takes a string argument, and returns true if all of the alphabetic characters inside the string are uppercase, false otherwise. 
Characters that are not alphabetic should be ignored.

Examples:
uppercase?('t') == false
uppercase?('T') == true
uppercase?('Four Score') == false
uppercase?('FOUR SCORE') == true
uppercase?('4SCORE!') == true
uppercase?('') == true

=end

LOWERCASE = ('a'..'z').to_a

def uppercase?(string)
  string.chars.each do |char|
    next if char =~ /[^A-Za-z]/
    return false if LOWERCASE.include?(char)
  end
  true
end

#launch school solution
def uppercase?(string)
  string == string.upcase
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true