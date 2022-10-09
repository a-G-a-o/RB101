#how can we change this code to make the result easier to predict and easier for the next programmer to maintain?

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"] #change << to += ["rutabaga"]

  return a_string_param, an_array_param #return both variables
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = tricky_method(my_string, my_array) #set both variables as the method

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"