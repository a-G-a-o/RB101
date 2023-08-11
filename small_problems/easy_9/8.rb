=begin

Write a method which takes a grocery list (array) of fruits with quantities and converts it into an array of the correct number of each fruit.

Example:
buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) == ["apples", "apples", "apples", "orange", "bananas","bananas"]

=end

#solution 1:
def buy_fruit(arr)
  new_arr = []
  arr.each do |sub_arr|  #alternate syntax: arr.each do |fruit, quantity|
    fruit, quantity = sub_arr[0], sub_arr[1]
    quantity.times { new_arr << fruit }
  end
  new_arr
end

#solution 2:
def buy_fruit(arr)
  arr.map { |fruit, quantity| [fruit] * quantity }.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) == ["apples", "apples", "apples", "orange", "bananas","bananas"]