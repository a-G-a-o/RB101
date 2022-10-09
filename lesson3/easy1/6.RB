#show two different ways to put "Four score and" in front of the string:

famous_words = "seven years ago..."

p famous_words.insert(0, "Four score and ")
p famous_words.prepend("Four score and ")

"Four score and " + famous_words
"Four score and " << famous_words