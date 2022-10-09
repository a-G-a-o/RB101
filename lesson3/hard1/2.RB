=begin

'puts greetings' will return the hash { a: 'hi there' } 
since 'informal_greeting' is a reference to the original object, appending using << changes the original object too.

=end

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings