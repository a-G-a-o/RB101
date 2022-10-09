=begin

Write a method that takes an integer argument, and returns an Array of all integers, in sequence, between 1 and the argument.

You may assume that the argument will always be a valid integer that is greater than 0.

Examples:
sequence(5) == [1, 2, 3, 4, 5]
sequence(3) == [1, 2, 3]
sequence(1) == [1]

Further exploration:
Food for thought: what do you think sequence should return if the argument is not greater than 0. 
For instance, what should you do if the argument is -1? Can you alter your method to handle this case?

=end

def sequence(number)
  new_arr = []
  (1..number).each {|num| new_arr << num}
  new_arr
end

#launch school solution:
def sequence(number)
  (1..number).to_a
end

#further exploration
def sequence(number)
  number > 0 ? (1..number).to_a : (number..1).to_a
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]