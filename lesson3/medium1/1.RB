#write a one line program that creates an output 10 times, with the subsequent line indented 1 space to the right

10.times { |number| puts (" " * number) + "The Flintstones Rock!" }

#compared to 10.times { puts phrase.prepend(' ') }, this program doesn't print out the 1st line with a space