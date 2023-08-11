=begin

Write a method that will take a short line of text, and print it within a box.
You may assume that the input will always fit in your terminal window.

Example:
print_in_box('To boldly go where no one has gone before.')
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+

print_in_box('')
+--+
|  |
|  |
|  |
+--+

Further Exploration:
⇒ Modify this method so it will truncate the message if it will be too wide to fit inside a standard terminal wines of the box). 
⇒ For a real challenge, try word wrapping very long messages so they appear on multiple lines, but still within a box.

=end

#Original solution:----------------------------------------------------------
def print_in_box(message)
  horizontal_line = "+#{'-' * (message.size + 2)}+"
  space_line = "|#{' ' * (message.size + 2)}|"

  puts horizontal_line
  puts space_line
  puts "| #{message} |"
  puts space_line
  puts horizontal_line
end

#Limit message to less than 80 characters:------------------------------------
LINE_LIMIT = 76

def split_text(message)
  result = message.slice(0..LINE_LIMIT)
  result
end

def print_in_box(message)
  message = split_text(message)
  horizontal_line = "+#{'-' * (message.size + 2)}+"
  space_line = "|#{' ' * (message.size + 2)}|"

  puts horizontal_line
  puts space_line
  puts "| #{message} |"
  puts space_line
  puts horizontal_line
end

#Wrap text:--------------------------------------------------------------------
def split_text(message, index)
  limit = index + (LINE_LIMIT - 1)
  limit = message.size if limit > message.size
  #sets limit variable so it can run any message size

  result = message.slice(index..limit)
  result
end

def print_message(message)
  index = 0
  multiplier = message.size / LINE_LIMIT

  #print full length lines first
  multiplier.times do 
    result = split_text(message, index)
    puts "| #{result} |"
    index += LINE_LIMIT
  end 

  #print remaining message characters plus additional spaces
  final_line = split_text(message, index)
  message.size <= LINE_LIMIT ? spaces = 0 : spaces = LINE_LIMIT - final_line.size
  puts "| #{final_line + (' ' * spaces)} |"
end

#main
def print_in_box(message)
  size = message.size 
  size = LINE_LIMIT if message.size > LINE_LIMIT
  #to ensure horizontal/space lines don't exceed 80 character limit

  horizontal_line = "+#{'-' * (size + 2)}+"
  space_line = "|#{' ' * (size + 2)}|"

  puts horizontal_line
  puts space_line
  print_message(message)
  puts space_line
  puts horizontal_line
end
