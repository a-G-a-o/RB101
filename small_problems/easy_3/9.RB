=begin

Write another method that returns true if the string passed as an argument is a palindrome, false otherwise. 
This time, however, your method should be case-insensitive, and it should ignore all non-alphanumeric characters. 
If you wish, you may simplify things by calling the palindrome? method you wrote in the previous exercise.

Examples:
real_palindrome?('madam') == true
real_palindrome?('Madam') == true           # (case does not matter)
real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
real_palindrome?('356653') == true
real_palindrome?('356a653') == true
real_palindrome?('123ab321') == false

-------------------------------------------------------------------------------------------
input: string
output: boolean
algorithm:  convert string input to lowercase and delete all non-alphanumerics and spaces
            use string == string.reverse

=end
def palindrome?(item)
  item == item.reverse
end

def real_palindrome?(item)
  item = item.downcase.delete('^a-z0-9')
  palindrome?(item)
end


p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false