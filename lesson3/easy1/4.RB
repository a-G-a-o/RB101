=begin

What do the following method calls do 
    (assume we reset numbers to the original array between method calls)?

numbers = [1, 2, 3, 4, 5]

numbers.delete_at(1)
numbers.delete(1)

=end

numbers = [1, 2, 3, 4, 5]

numbers.delete(1)
p numbers

#numbers.delete_at(1) removes the value at the 1 position
#numbers.delete(1) removes '1' from the array