=begin

Write a method that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character. 

You may not use String#squeeze or String#squeeze!.

Further exploration:
Can you determine why we didn't use String#each_char or String#chars to iterate through the string? How would you update this method to use String#each_char or String#chars?
Solve this problem using regular expressions (see the Regexp class documentation).

Examples:
crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''

=end

def crunch(string)
  new_str = ''
  index = 0
  while index <= string.length - 1
    new_str << string[index] unless string[index] == string[index + 1]
    index += 1
  end
  new_str
end

def crunch(string)
  new_str = ''
  index = 0
  while index <= string.length - 1
    new_str << string[index] unless string[index] == string[index + 1]
    index += 1
  end
  new_str
end

#Further exploration:----------------------------------------------------------------
#Using String#chars
def crunch(string)
  new_str = ''
  string.chars.each do |char|
    new_str << char unless new_str.chars.last == char
  end
  new_str
end

#Using String#each_chars
def crunch(string)
  string.each_char.with_object('') do |letter, new_string|
    new_string << letter unless new_string[-1] == letter
  end
end

#Using regex...
def crunch(string)
  str.gsub(/(.)1+/, '\1')
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]