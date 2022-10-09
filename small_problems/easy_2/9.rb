#What does this print out? Can you explain these results?

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

=begin

BOB
BOB

Because .upcase! mutates the caller, the variable name changes to 'BOB'. 
save_name is only a reference/pointer to name, which means save_name is also 'BOB'.

=end