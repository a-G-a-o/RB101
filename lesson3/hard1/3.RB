=begin

A) this code would print out 
"one is: one
two is: two
three is: three"
Variable reassignment within the method does not affect the original object outside the method.

B) this code would also print out 
"one is: one
two is: two
three is: three"
Once again, reassigning the variables to a specific String within the method does not affect the original oject outside the method.

C) this could would print out
"one is: two
two is: three
three is: one"
Reassignment within the method using .gsub! affects the original object.

=end

#A
def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

#B
def mess_with_vars2(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars2(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

#C
def mess_with_vars3(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars3(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"