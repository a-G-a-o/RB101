=begin

Write a method that takes a string as an argument and returns a new string in which every 
uppercase letter is replaced by its lowercase version, and every lowercase letter by its uppercase version. 
All other characters should be unchanged.

You may not use String#swapcase; write your own version of this method.

Example:
swapcase('CamelCase') == 'cAMELcASE'
swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

Further exploration:
Modify this method so the caller can request that the first character be downcased rather than upcased. 
If the first character is downcased, then the second character should be upcased, and so on.

=end

#launch school solution:
def staggered_case(string)
  new_str = ''
  switch = true
  string.chars.each do |char|
    if switch
      new_str << char.upcase 
    else
     new_str << char.downcase
    end
    switch = !switch
  end
  new_str
end

#my solution:
def staggered_case(string)
  string.chars.map.with_index do |char, idx|
    if char =~ /[A-z]/ && idx.even?
      char.upcase
    elsif char =~ /[A-z]/ && idx.odd?
      char.downcase
    else
      char
    end
  end.join
end

#further exploration:
def staggered_case(string, lettercase)
  new_str = ''
  switch = lettercase
  string.chars.each do |char|
    if switch
      new_str << char.upcase 
    else
     new_str << char.downcase
    end
    switch = !switch
  end
  new_str
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'