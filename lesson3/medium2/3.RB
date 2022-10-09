#My string looks like this now: "pumpkins" because my_string within the method does not modify my_string outside the method.
#My array looks like this now: ["pumpkins", "rutabaga"], because << in the method does modify my_array outside the method.

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"