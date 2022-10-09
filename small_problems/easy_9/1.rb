=begin

Create a method that takes 2 arguments, an array and a hash. 
The array will contain 2 or more elements that, when combined with adjoining spaces, will produce a person's name. 
The hash will contain two keys, :title and :occupation, and the appropriate values. 
Your method should return a greeting that uses the person's full name, and mentions the person's title and occupation.

Example:
greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
=> Hello, John Q Doe! Nice to have a Master Plumber around.

Further exploration:
This method doesn't actually pass rubocop! What is the best way to shorten the lines in this method so it doesn't exceed the 80 maximum characters to a line?

=end

def greetings(arr, hsh)
  "Hello, #{arr.join(' ')}! Nice to have a #{hsh[:title]} #{hsh[:occupation]} around."
end

#further exploration:
def greetings(arr, hsh)
  name = arr.join(' ')
  title = "#{hsh[:title]} #{hsh[:occupation]}"
  "Hello, #{name}! Nice to have a #{title} around."
end

def greetings(name, status)
  puts "Hello, #{name.join(' ')}! "\
       "Nice to have a #{status[:title]} #{status[:occupation]} around."
end

p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
p greetings(['James', 'G', 'Ignatius'], { title: 'Senior', occupation: 'Software Engineer' })
p greetings(['Georgia', 'R', 'Peach'], { title: 'Head', occupation: 'Chef' })
