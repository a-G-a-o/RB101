def upper_snake(str)
  words = str.split
  current_word = 0

  loop do
    words[current_word].upcase!

    current_word += 1
    break if current_word == words.size
  end

  words.join('_')
end

sentence = 'The sky is blue'

p upper_snake(sentence)