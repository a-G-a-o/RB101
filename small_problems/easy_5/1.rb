=begin

Write a method that determines and returns the ASCII string value of a string that is passed in as an argument. 
The ASCII string value is the sum of the ASCII values of every character in the string. 
(You may use String#ord to determine the ASCII value of a character.)

Example output:
ascii_value('Four score') == 984
ascii_value('Launch School') == 1251
ascii_value('a') == 97

Further exploration:
Can you determine what method name should be used in place of mystery? 
What happens if you try this with a longer string instead of a single character?

char.ord.mystery == char

=end

def ascii_value(string)
  sum = 0
  
  string.each_char { |char| sum += char.ord }
  sum
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

#Further exploration:
char.ord.chr == char
#⇒ if more than one character is used, return is false