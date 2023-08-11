=begin

Given the array...

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

Write a program that prints out groups of words that are anagrams. 
Anagrams are words that have the same exact letters in them but in a different order. 

Your output should look something like this:
["demo", "dome", "mode"]
["neon", "none"]
#(etc)

Algorithm:  initiate results hash
            parse through array argument
              split each word into characters, sort the characters, and join back to a string
              check if results hash has the sorted 'word'
                - if yes: then push the unsorted 'word' into value
                - if no: then create new 'key' with sorted key and 'word' value
            print values in results hash

=end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

results = {}

words.each do |word|
  key = word.split('').sort.join
  if results.has_key?(key)
    results[key].push(word)
  else
    results[key] = [word]
  end
end

results.each_value do |value|
  puts "------" #display dividing line
  p value
end

#alternate solution: avoids single anagram results
def anagram(words)
  result = words.group_by { |word| word.chars.sort.join }
  result.each {|k, v| p v unless v.size == 1}
end

