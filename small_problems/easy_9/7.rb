=begin

Write a method that takes a first name, a space, and a last name passed as a single String argument, 
and returns a string that contains the last name, a comma, a space, and the first name.

Examples:
swap_name('Joe Roberts') == 'Roberts, Joe'

=end

def swap_name(string)
  string.split(' ').reverse.join(', ')
end

#my solution:
def swap_name(string)
  arr = string.split
  "#{arr[1]}, #{arr[0]}"
end

p swap_name('Joe Roberts') == 'Roberts, Joe'