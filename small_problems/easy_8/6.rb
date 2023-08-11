=begin

Write a method that takes a string, and returns a new string in which every character is doubled.

Examples:
repeater('Hello') == "HHeelllloo"
repeater("Good job!") == "GGoooodd  jjoobb!!"
repeater('') == ''

=end

def repeater(string)
  new_str = ''

  string.chars.each do |char|
    2.times do 
      new_str << char
    end
  end

  #string.each_char do |char|
     #new_str << char << char
  #end
  new_str
end

#alternate solutions:
def repeater(string)
  string.chars.map { |char| char * 2 }.join
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''