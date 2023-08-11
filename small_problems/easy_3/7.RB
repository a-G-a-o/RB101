=begin

Write a method that returns true if the string passed as an argument is a palindrome, false otherwise. 
A palindrome reads the same forward and backward. For this exercise, case matters as does punctuation and spaces.

Examples:

palindrome?('madam') == true
palindrome?('Madam') == false          # (case matters)
palindrome?("madam i'm adam") == false # (all characters matter)
palindrome?('356653') == true

-----------------------------------------------------------------------------------------------------
input: string
output: boolean - true/false
algorithm:  brute force solution that I didn't use:
            loop through word
              if first letter matches last letter
                then check if letter2 matches last letter - 1
                check matches until it reaches center of the string

=end

def palindrome?(string)
  string == string.reverse
end

def palindrome?(array)
  array == array.reverse
end

def multi_purpose_palindromic_detector(item)
  item == item.reverse
end

p palindrome?([1, 10, 100, 10, 1]) == true
p palindrome?(['a', 'b', 'c']) == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true

=begin
Further exploration:
Write a method that can take either an array or a string argument, and determines whether that argument is a palindrome.

Write a method that determines whether an array is palindromic:

=end

