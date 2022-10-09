=begin

Modify the method from the previous exercise so it ignores non-alphabetic characters when determining whether it should uppercase or lowercase each letter. 
The non-alphabetic characters should still be included in the return value; they just don't count when toggling the desired case.

Example:
staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
staggered_case('ALL CAPS') == 'AlL cApS'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

Further exploration:
Modify this method so the caller can determine whether non-alphabetic characters should be counted when determining the upper/lowercase state. 
That is, you want a method that can perform the same actions that this method does, or operates like the previous version.

=end

def staggered_case(string)
  new_str = ''
  switch = true
  string.chars.each do |char|
    if char =~ /[^A-z]/
      new_str << char
      next
    elsif switch
      new_str << char.upcase 
    else
     new_str << char.downcase
    end
    switch = !switch
  end
  new_str
end

#launch school solution:
def staggered_case(string)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if char =~ /[a-z]/i
      if need_upper
        result += char.upcase
      else
        result += char.downcase
      end
      need_upper = !need_upper
    else
      result += char
    end
  end
  result
end

#further exploration:
def staggered_case(string, boolean)
  new_str = ''
  switch = true
  string.chars.each do |char|
    if boolean && char =~ /[^A-z]/
      new_str << char
      next
    elsif switch
      new_str << char.upcase 
    else
     new_str << char.downcase
    end
    switch = !switch
  end
  new_str
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'