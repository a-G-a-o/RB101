=begin

Write a method that takes a String as an argument, and returns a new String that contains the original value using a 
staggered capitalization scheme in which every other character is capitalized, and the remaining characters are lowercase. 
Characters that are not letters should not be changed, but count as characters when switching between upper and lowercase.

Example:
staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
staggered_case('ALL_CAPS') == 'AlL_CaPs'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
=end

require 'pry'

def staggered_case(string)
  new_str = ''

  string.chars.each_with_index do |char, index|
    if index.odd?
      new_str << char.downcase
    else
      new_str << char.upcase
    end
  end
  new_str
  #binding.pry
end

#launch school solution:
def staggered_case(string)
  new_str = ''
  switch = true
  string.chars.each do |char|
    if switch
      new_str += char.upcase
    else
      new_str += char.downcase
    end
    switch = !switch
  end
  new_str
end

#further exploration:
def staggered_case(string, switch_case)
  new_str = ''
  switch = switch_case
  string.chars.each do |char|
    if switch
      new_str += char.upcase
    else
      new_str += char.downcase
    end
    switch = !switch
  end
  new_str
end

p staggered_case('I Love Launch School!', true)
p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'