=begin

Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters in the string that are lowercase letters, one the number of characters that are uppercase letters, and one the number of characters that are neither.

Examples:
letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

=end

#solution 1:
UPPERCASE = ('A'..'Z').to_a
LOWERCASE = ('a'..'z').to_a

def letter_case_count(str)
  count_hash = { lowercase: 0, uppercase: 0, neither: 0 }

  str.each_char do |char|
    if LOWERCASE.include?(char)
      count_hash[:lowercase] += 1
    elsif UPPERCASE.include?(char)
      count_hash[:uppercase] += 1
    else
      count_hash[:neither] += 1
    end
  end

  count_hash
end

#solution 2:
def letter_case_count(str)
  count_hash = {}
  characters = str.chars

  count_hash[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  count_hash[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  count_hash[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }
  count_hash
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }