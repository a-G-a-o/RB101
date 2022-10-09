#Using the each method, write some code to output all of the vowels from the string:

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

vowels = ['a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U']

hsh.each_value { |array|
  array.each { |string|
    string.chars.each { |char|
      puts char if vowels.include?(char)
    }
  }
}

#set vowels array to all the lowercase and uppercase vowels
#parse through each value of the hsh
  #split each string value into individual chars using String#chars 
  #using an embedded .each block, print character if character matches vowels